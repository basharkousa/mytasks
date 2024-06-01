import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytasks/src/data/models/api_state.dart';
import 'package:mytasks/src/data/models/projectsmodels/projectsresponse/projects_response.dart';
import 'package:mytasks/src/data/remote/exceptions/dio_error_util.dart';
import 'package:mytasks/src/utils/basic_tools.dart';
import '../../src/data/repository.dart';

// SingleGetTickerProviderMixin
class AppController extends GetxController with GetTickerProviderStateMixin {
  final Repository repository;

  static AppController controller = Get.find();

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

  AppController(this.repository);

  RxBool isUserClientLoggedIn = false.obs;

  @override
  void onInit() async {
    print('AppController_init()');
    getProjectsEasyWay();
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
}
