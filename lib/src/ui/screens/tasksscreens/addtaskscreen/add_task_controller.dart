import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mytasks/src/data/models/api_state.dart';
import 'package:mytasks/src/data/models/tasksmodels/task_form_model.dart';
import 'package:mytasks/src/data/models/tasksmodels/tasksresponse/task_model.dart';
import 'package:mytasks/src/data/repository.dart';
import 'package:mytasks/src/ui/screens/projectsscreens/projectdetailsscreen/project_details_screen.dart';

// with SingleGetTickerProviderMixin
class AddTaskController extends GetxController{

  final Repository repository = Get.find();


  AddTaskController();

  AppFlowyGroupData group = Get.arguments["group"];
  var projectId = Get.arguments["projectId"];

  final form = GlobalKey<FormState>();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode descriptionFocusNode = FocusNode();

  ScrollController scrollController = ScrollController();

  TextEditingController taskTitleEditingController = TextEditingController();
  TextEditingController dueDateEditingController = TextEditingController();
  TextEditingController taskDescriptionEditingController = TextEditingController();


  TaskForm taskForm = TaskForm();

  @override
  void onInit() {

    super.onInit();
  }

  @override
  void onClose() {
    descriptionFocusNode.dispose();
    super.onClose();
  }


  Future<void> onRefresh() async{

  }

  // void goToProjectDetailsScreen(ProjectModel project) {
  //   Get.toNamed(ProjectDetailsScreen.route,arguments: project);
  // }

  var addTaskResponseLiveData = ApiState<TaskModel>.completed(null).obs;
  void postTask() {
    taskForm.projectId = projectId;
    taskForm.sectionId = group.id;
    repository.postTask(taskForm).listen((event){
      addTaskResponseLiveData.value = event;
      switch(addTaskResponseLiveData.value.status){
        case Status.LOADING:
          break;
        case Status.COMPLETED:
          Get.back(result: addTaskResponseLiveData.value.data);
          break;
        case Status.ERROR:
          break;
      }
    });
    print(taskForm.toString());
  }
}