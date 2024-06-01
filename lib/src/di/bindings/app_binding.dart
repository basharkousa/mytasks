import 'package:get/get.dart';
import '../../controllers/app_controller.dart';
import '../../data/repository.dart';
import 'modules/local_bindings.dart';
import 'modules/remote_bindings.dart';
import '../../ui/screens/getStartedScreens/splashScreen/splash_screen_controller.dart';

class AppBindings extends Bindings {
  // final Repository repository;

  // final GlobalAppBloc globalAppBloc;

  AppBindings();

  @override
  void dependencies() {

    LocalBindings().dependencies();

    RemoteBindings().dependencies();

    Get.lazyPut<Repository>(() {
      return Repository(Get.find(), Get.find());
    }, fenix: true);

    Get.put(AppController(Get.find<Repository>()), permanent: true);

    Get.create<SplashScreenController>(() {
      return SplashScreenController(Get.find<Repository>());
    });

    /*---------------------------- ACCOUNT CONTROLLERS -------------------------------*/

 /*   Get.lazyPut<LoginController>(() {
      return LoginController();
    }, fenix: true);

    Get.create<SignUpController>(() {
      return SignUpController();
    });*/

    // //I added lazyPut for when I change language doesn't refresh and call the request.
    // Get.lazyPut<SelectLanguageController>(() {
    //   return SelectLanguageController();
    // });

    /*---------------------------- SHOPS CONTROLLERS -------------------------------*/


  }
}
