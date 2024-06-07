import 'package:get/get.dart';
import 'package:mytasks/src/ui/screens/projectsscreens/projectsscreen/projects_screen.dart';
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
    Future.delayed(const Duration(milliseconds: 3100), () {
      goToProjectsScreen();
    });
    super.onInit();
  }




  Future<void> goToProjectsScreen() async {
    Get.offNamed(ProjectsScreen.route);
  }

}
