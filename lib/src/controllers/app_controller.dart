import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mytasks/src/data/models/api_state.dart';
import 'package:mytasks/src/data/models/projectsmodels/projectsresponse/projects_response.dart';
import 'package:mytasks/src/data/models/tasksmodels/tasksresponse/task_model.dart';
import 'package:mytasks/src/data/remote/exceptions/dio_error_util.dart';
import '../../src/data/repository.dart';

// SingleGetTickerProviderMixin
class AppController extends GetxController with GetTickerProviderStateMixin {
  final Repository repository;

  static AppController controller = Get.find();

  AppController(this.repository);


  Isolate? backgroundIsolate;

  Future<void> startBackgroundIsolate(TaskModel task) async {
    // final receivePort = ReceivePort();
    // backgroundIsolate = await Isolate.spawn(backgroundIsolatee, receivePort.sendPort);
    //
    // receivePort.listen((message) {
    //   final taskId = message['taskId'] as String;
    //   final elapsed = message['elapsed'] as double;
    //   // Update task data in state management with elapsed time for taskId
    //   task.stopTimer();
    // });
  }

  RxBool isUserClientLoggedIn = false.obs;

  List<TaskModel>? taskHistoryList = [];
  getTaskHistoryList() async{
    taskHistoryList = await repository.getTaskHistoryList();
    print("taskHistoryListLength ${taskHistoryList?.length}");
  }

  @override
  void onInit() async {
    print('AppController_init()');
    getTaskHistoryList();
    listenToFirebase();
    super.onInit();
  }

  @override
  void dispose() {
    // tabController!.dispose();
    super.dispose();
  }

  //todo remove: it is just an example
  void listenToFirebase() async {}

  logOutUser() async {
    await repository.removeUser();
    repository.getUser().then((user) {
      print('AfterLogoutUser: ${user.toString()}');
    });
    isUserClientLoggedIn.value = false;
    // _handleLogoutExternalUserId();
    // Get.offAllNamed(HomePage.homePageRoute);
  }

  checkUserLogin({required Function? isLogged, Function? isNotLogged}) {
    if (isUserClientLoggedIn.value) {
      isLogged!();
    } else {
      //isNotLogged();
      // Get.toNamed(LoginPage.loginPageRoute);
    }
  }


  //Here Just Elaboration for how can we Call apis in the app
  var projectsResponseLiveData = ApiState<ProjectsResponse>.loading().obs;
  //I Added to ways to call Api to show the differences between them here and in Repository.
  getProjectsEasyWay() {
    repository.getProjectsEasyWay().listen((event) {
      projectsResponseLiveData.value = event;
    });
  }
  getProjects() async {
    projectsResponseLiveData.value = ApiState.loading();
    try {
      ProjectsResponse projectsResponse = await repository.getProjects();
      projectsResponseLiveData.value = ApiState.completed(projectsResponse);
    } on DioException catch (error, stacktrace) {
      projectsResponseLiveData.value =
          ApiState.error(DioErrorUtil.handleError(error));
      print('DioException$error $stacktrace');
    } catch (error, stacktrace) {
      projectsResponseLiveData.value = ApiState.error(error.toString());
      print('OtherException:$error $stacktrace');
    }
  }
}
