import 'package:appflowy_board/appflowy_board.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mytasks/src/data/models/api_state.dart';
import 'package:mytasks/src/data/models/projectsmodels/project_model.dart';
import 'package:mytasks/src/data/models/sectionsmodels/section_model.dart';
import 'package:mytasks/src/data/models/sectionsmodels/sectionsresponse/sections_response.dart';
import 'package:mytasks/src/data/models/tasksmodels/tasksresponse/task_model.dart';
import 'package:mytasks/src/data/models/tasksmodels/tasksresponse/tasks_response.dart';
import 'package:mytasks/src/data/remote/exceptions/dio_error_util.dart';
import 'package:mytasks/src/data/repository.dart';

// with SingleGetTickerProviderMixin
class ProjectDetailsController extends GetxController{

  final Repository repository = Get.find();

  ProjectModel project = Get.arguments;

  ProjectDetailsController();

  var sectionsResponseLiveData = ApiState<SectionsResponse>.loading().obs;
  getSections() async {
    sectionsResponseLiveData.value = ApiState.loading();
    try {
      SectionsResponse sectionsResponse = await repository.getSections(project);
      createSections(sectionsResponse);
      // sectionsResponseLiveData.value = ApiState.completed(sectionsResponse);
    } on DioException catch (error, stacktrace) {
      sectionsResponseLiveData.value =
          ApiState.error(DioErrorUtil.handleError(error));
      print('DioException$error $stacktrace');
    } catch (error, stacktrace) {
      sectionsResponseLiveData.value = ApiState.error(error.toString());
      print('OtherException:$error $stacktrace');
    }

    // repository.getSections(project).listen((event) {
    //   sectionsResponseLiveData.value = event;
    //   switch(sectionsResponseLiveData.value.status){
    //     case Status.LOADING:
    //       break;
    //     case Status.COMPLETED:
    //
    //       break;
    //     case Status.ERROR:
    //       break;
    //   }
    // });
  }

  final AppFlowyBoardController appFlowyController = AppFlowyBoardController(

    onMoveGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
      // debugPrint('Move item from $fromIndex to $toIndex');
    },
    onMoveGroupItem: (groupId, fromIndex, toIndex) {
      debugPrint('Move $groupId:$fromIndex to $groupId:$toIndex');
    },
    onMoveGroupItemToGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
      debugPrint('Move $fromGroupId:$fromIndex to $toGroupId:$toIndex');
    },
  );


  @override
  void onInit() {
    appFlowyController.enableGroupDragging(false);
    getSections();

    /* final group1 = AppFlowyGroupData(
        id: "ToDo",
        name: "To Do",
        items: [
      TaskItemFlowy("Card 1"),
      TaskItemFlowy("Card 2"),
    ]);
    final group2 = AppFlowyGroupData(id: "InProgress", name: "In Progress",
        items: [
      TaskItemFlowy("Card 3"),
      TaskItemFlowy("Card 4"),

    ]);
    final group3 = AppFlowyGroupData(id: "Done",name: "Done",
        items: []);

    appFlowyController.addGroup(group1);
    appFlowyController.addGroup(group2);
    appFlowyController.addGroup(group3);*/
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> onRefresh() async{

  }

  void createSections(SectionsResponse? data) async{
    for(SectionModel section in data?.sections??[]){
      final group = AppFlowyGroupData(
          id: "${section.id}",
          name: "${section.name}",
          items: List<AppFlowyGroupItem>.from(await getTasks(project,section)));

      appFlowyController.addGroup(group);
    }

    //to stop the Loading when the all the tasks are loaded!!
    sectionsResponseLiveData.value = ApiState.completed(data);

  }

  getTasks(ProjectModel project, SectionModel section) async{
    // List<TaskItemFlowy> taskItemFlowyList = [TaskItemFlowy("Card 1"),];
    List<TaskItemFlowy> taskItemFlowyList = [];

    section.tasksResponseLiveData.value = ApiState.loading();
    try {
      TasksResponse tasksResponse = await repository.getTasks(project: project,section: section);
      section.tasksResponseLiveData.value = ApiState.completed(tasksResponse);
      section.tasksResponseLiveData.value.data?.tasks?.forEach((task){
        taskItemFlowyList.add(TaskItemFlowy(task));
      });
    } on DioException catch (error, stacktrace) {
      section.tasksResponseLiveData.value =
          ApiState.error(DioErrorUtil.handleError(error));
      print('DioException$error $stacktrace');
    } catch (error, stacktrace) {
      section.tasksResponseLiveData.value = ApiState.error(error.toString());
      print('OtherException:$error $stacktrace');
    }


    /* repository.getTasks(project: project,section: section).listen((event){
       section.tasksResponseLiveData.value = event;
       switch(section.tasksResponseLiveData.value.status){
         case Status.LOADING:
           break;
         case Status.COMPLETED:
           section.tasksResponseLiveData.value.data?.tasks?.forEach((task){
             taskItemFlowyList.add(TaskItemFlowy(task));
           });
           break;
         case Status.ERROR:
           break;
       }
    });*/
    return taskItemFlowyList;
  }
}

class TaskItemFlowy extends AppFlowyGroupItem {
  final TaskModel taskModel;
  TaskItemFlowy(this.taskModel);

  @override
  String get id => taskModel.id.toString();
}