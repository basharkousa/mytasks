import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../../data/models/api_response.dart';
import '../../../../data/models/authmodels/signupresponse/signup_respose.dart';
import '../../../../data/models/user/user.dart';
import '../../../../data/repository.dart';
import '../../../../utils/basic_tools.dart';

// import 'package:onesignal_flutter/onesignal_flutter.dart';

class SplashScreenController extends GetxController {
  final Repository repository;

  // var loginResponseLiveData = ApiResponse<SignUpResponse>.completed(SignUpResponse(result: Result(user_id: 2))).obs;
  var loginResponseLiveData = ApiResponse<SignUpResponse>.loading("message").obs;

  SplashScreenController(this.repository);

  @override
  void onInit() {
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    // Future.delayed(const Duration(milliseconds: 1100), () {
    // doLogin(user);
    // });
    super.onInit();
  }


  doLogin(User user) async {
    repository.getUser().then((user) {
      print('AfterSplashSavedUser: ${user.toString()}');
    });
    loginResponseLiveData.value = ApiResponse.loading('fetchOdooUserToken');
    try {
      SignUpResponse loginResponse = await repository.doSignUp(user);
      // print('loginResponse.expiresIn ${loginResponse.expiresIn}');
      await repository.saveUser(User(
          password: user.password,
          email: user.email,
          userId: loginResponse.result?.user_id,));
      loginResponseLiveData.value = ApiResponse.completed(loginResponse);
      //
      // AppController.controller.isUserClientLoggedIn.value = true;
      // AppController.controller.getUserProfile();
      goToHomePage();
    } on DioException catch (error) {
      try {
        // odooTokenLiveData.value =
        //     ApiResponse.error(DioErrorUtil.handleError(error));
      } catch (error) {
        BasicTools.showToastMessage("Error form Server");
      }
    }
  }

  Future<void> goToHomePage() async {
    // Get.offNamed(HomePage.homePageRoute);
  }

}
