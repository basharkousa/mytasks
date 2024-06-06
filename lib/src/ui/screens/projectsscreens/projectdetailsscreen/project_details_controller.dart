import 'package:appflowy_board/appflowy_board.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mytasks/src/data/models/api_state.dart';
import 'package:mytasks/src/data/models/projectsmodels/project_model.dart';
import 'package:mytasks/src/data/models/sectionsmodels/section_model.dart';
import 'package:mytasks/src/data/models/sectionsmodels/sectionsresponse/sections_response.dart';
import 'package:mytasks/src/data/models/tasksmodels/task_form_model.dart';
import 'package:mytasks/src/data/models/tasksmodels/tasksresponse/task_model.dart';
import 'package:mytasks/src/data/models/tasksmodels/tasksresponse/tasks_response.dart';
import 'package:mytasks/src/data/remote/exceptions/dio_error_util.dart';
import 'package:mytasks/src/data/repository.dart';
import 'package:mytasks/src/ui/screens/tasksscreens/addtaskscreen/add_task_screen.dart';
import 'package:mytasks/src/ui/screens/tasksscreens/commentsscreen/comments_screen.dart';
import 'package:mytasks/src/ui/screens/tasksscreens/edittaskscreen/edit_task_screen.dart';

// with SingleGetTickerProviderMixin
class ProjectDetailsController extends GetxController {
  final Repository repository = Get.find();
  ProjectModel project = Get.arguments;

  ProjectDetailsController();

  AppFlowyBoardController? appFlowyController;
  var sectionsResponseLiveData = ApiState<SectionsResponse>.loading().obs;

  getSections() async {
    sectionsResponseLiveData.value = ApiState.loading();
    try {
      SectionsResponse sectionsResponse = await repository.getSections(project);
      createSections(sectionsResponse);
      sectionsResponseLiveData.value = ApiState.completed(sectionsResponse);
    } on DioException catch (error, stacktrace) {
      sectionsResponseLiveData.value =
          ApiState.error(DioErrorUtil.handleError(error));
      print('DioException$error $stacktrace');
    } catch (error, stacktrace) {
      sectionsResponseLiveData.value = ApiState.error(error.toString());
      print('OtherException:$error $stacktrace');
    }
  }

  @override
  void onInit() {
    appFlowyController = AppFlowyBoardController(
      onMoveGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {},
      onMoveGroupItem: (groupId, fromIndex, toIndex) {},
      onMoveGroupItemToGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
        debugPrint('Move $fromGroupId:$fromIndex to $toGroupId:$toIndex');

        AppFlowyGroupController? appFlowyFromGroupController =
            appFlowyController?.getGroupController(fromGroupId);
        AppFlowyGroupController? appFlowyToGroupController =
            appFlowyController?.getGroupController(toGroupId);
        TaskItemFlowy? appFlowyGroupItem =
            appFlowyToGroupController?.items[toIndex] as TaskItemFlowy;

        handleMoveTaskToGroup(appFlowyFromGroupController,
            appFlowyToGroupController, appFlowyGroupItem);

        print(
            "Lenght ${appFlowyFromGroupController?.groupData.headerData.groupName} appFlowyGroupItem.id${appFlowyGroupItem.taskModel.content}");

        debugPrint(
            'onMoveGroupItemToGroup: Move ${appFlowyFromGroupController?.groupData.headerData.groupName}:${appFlowyGroupItem.taskModel.content} to ${appFlowyToGroupController?.groupData.headerData.groupName}:$toIndex');
      },
    );
    getSections();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> onRefresh() async {}

  void createSections(SectionsResponse? data) async {
    for (SectionModel section in data?.sections ?? []) {
      final group = AppFlowyGroupData(
          id: "${section.id}",
          name: "${section.name}",
          items:
              List<AppFlowyGroupItem>.from(await getTasks(project, section)));

      appFlowyController?.addGroup(group);
    }

    //to stop the Loading when the all the tasks are loaded!!
    // sectionsResponseLiveData.value = ApiState.completed(data);
  }

  getTasks(ProjectModel project, SectionModel section) async {
    // List<TaskItemFlowy> taskItemFlowyList = [TaskItemFlowy("Card 1"),];
    List<TaskItemFlowy> taskItemFlowyList = [];

    section.tasksResponseLiveData.value = ApiState.loading();
    try {
      TasksResponse tasksResponse =
          await repository.getTasks(project: project, section: section);
      section.tasksResponseLiveData.value = ApiState.completed(tasksResponse);
      section.tasksResponseLiveData.value.data?.tasks?.reversed.forEach((task) {
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
    return taskItemFlowyList;
  }

  void goToAddTaskScreen(AppFlowyGroupData group, SectionsResponse data) async {
    print(group.id + " " + group.headerData.groupId);
    var addedTask = await Get.toNamed(AddTaskScreen.route,
        arguments: {"group": group, "projectId": project.id});
    if (addedTask != null) {
      TaskModel taskModel = addedTask;
      appFlowyController?.insertGroupItem(
          group.id, 0, TaskItemFlowy(taskModel));
    }
  }

  void goToEditTaskScreen(TaskItemFlowy taskItemFlowy) async {
    var addedTask = await Get.toNamed(EditTaskScreen.route,
        arguments: taskItemFlowy.taskModel);
    if (addedTask != null) {
      TaskModel taskModel = addedTask;
      appFlowyController?.updateGroupItem(
          taskItemFlowy.taskModel.sectionId.toString(),
          TaskItemFlowy(taskModel));
    }
  }

  void deleteTask(TaskItemFlowy taskItemFlowy, AppFlowyGroupData group) {
    repository.deleteTask(taskItemFlowy.taskModel.id).listen((event) {
      taskItemFlowy.taskModel.deleteTaskLiveData.value = event;
      print("event ${event.status}");
      switch (event.status) {
        case Status.LOADING:
          break;
        case Status.COMPLETED:
          appFlowyController?.removeGroupItem(
              group.id, taskItemFlowy.taskModel.id!);
          break;
        case Status.ERROR:
          break;
      }
    });
  }

  void goToCommentsScreen(TaskItemFlowy taskItemFlowy) {
    Get.toNamed(CommentsScreen.route, arguments: taskItemFlowy.taskModel);
  }

  void handleMoveTaskToGroup(
      AppFlowyGroupController? appFlowyFromGroupController,
      AppFlowyGroupController? appFlowyToGroupController,
      TaskItemFlowy appFlowyGroupItem) {
    //Add task to group once it done remove it from the group
    TaskModel taskModel = appFlowyGroupItem.taskModel;
    TaskForm taskForm = TaskForm()
      ..projectId = project.id
      ..sectionId = appFlowyToGroupController?.groupData.headerData.groupId
      ..content = taskModel.content
    ..description = taskModel.description
    ..dueDate = taskModel.due?.date;
    repository.postTask(taskForm).listen((event) {
      switch(event.status){
        case Status.LOADING:
          break;
        case Status.COMPLETED:
          if(appFlowyToGroupController?.groupData.headerData.groupName == "Completed"){
              taskModel.spentTime = "${DateTime.now()}";
             repository.addTaskHistoryItem(taskModel);
             print("ADD_To_HISTORY ${taskModel.content}");
          }
           //remove it from group
           //I had to remove it after I add it again to another group because no api
           // to do that or to update the sectionId at least
          repository.deleteTask(taskModel.id).listen((event){});
          break;
        case Status.ERROR:
          break;
      }
    });
  }
}

class TaskItemFlowy extends AppFlowyGroupItem {
  final TaskModel taskModel;

  TaskItemFlowy(this.taskModel);

  @override
  String get id => taskModel.id.toString();
}
