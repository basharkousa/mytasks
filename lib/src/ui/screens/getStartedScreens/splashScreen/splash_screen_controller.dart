import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../../data/models/api_state.dart';
import '../../../../data/models/authmodels/signupresponse/signup_respose.dart';
import '../../../../data/models/user/user.dart';
import '../../../../data/repository.dart';
import '../../../../utils/basic_tools.dart';

// import 'package:onesignal_flutter/onesignal_flutter.dart';

class SplashScreenController extends GetxController {
  final Repository repository;

  // var loginResponseLiveData = ApiResponse<SignUpResponse>.completed(SignUpResponse(result: Result(user_id: 2))).obs;
  var loginResponseLiveData = ApiState<SignUpResponse>.loading().obs;

  SplashScreenController(this.repository);

  @override
  void onInit() {
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    // Future.delayed(const Duration(milliseconds: 1100), () {
    // doLogin(user);
    // });
    super.onInit();
  }




  Future<void> goToHomePage() async {
    // Get.offNamed(HomePage.homePageRoute);
  }

}
