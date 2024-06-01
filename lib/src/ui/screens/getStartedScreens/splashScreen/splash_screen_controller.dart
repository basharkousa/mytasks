import 'package:get/get.dart';
import '../../../../data/models/api_state.dart';
import '../../../../data/models/authmodels/signupresponse/signup_respose.dart';
import '../../../../data/repository.dart';

class SplashScreenController extends GetxController {
  final Repository repository;

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
