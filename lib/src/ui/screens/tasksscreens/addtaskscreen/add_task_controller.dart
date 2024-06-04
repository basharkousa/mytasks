import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mytasks/src/data/models/api_state.dart';
import 'package:mytasks/src/data/models/projectsmodels/project_model.dart';
import 'package:mytasks/src/data/models/projectsmodels/projectsresponse/projects_response.dart';
import 'package:mytasks/src/data/models/tasksmodels/task_form_model.dart';
import 'package:mytasks/src/data/repository.dart';
import 'package:mytasks/src/ui/screens/projectsscreens/projectdetailsscreen/project_details_screen.dart';

// with SingleGetTickerProviderMixin
class AddTaskController extends GetxController{

  final Repository repository = Get.find();

  var addTaskLiveData = ApiState.completed("").obs;

  AddTaskController();

  AppFlowyGroupData group = Get.arguments["group"];

  final form = GlobalKey<FormState>();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode descriptionFocusNode = FocusNode();

  ScrollController scrollController = ScrollController();

  TaskForm taskForm = TaskForm();

  var projectsResponseLiveData = ApiState<ProjectsResponse>.loading().obs;
  getProjects() {
    repository.getProjectsEasyWay().listen((event) {
      projectsResponseLiveData.value = event;
    });
  }

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
    getProjects();
  }

  void goToProjectDetailsScreen(ProjectModel project) {
    Get.toNamed(ProjectDetailsScreen.route,arguments: project);
  }
}