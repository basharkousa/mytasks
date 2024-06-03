import 'package:get/get.dart';
import 'package:mytasks/src/ui/screens/projectsscreens/projectdetailsscreen/project_details_controller.dart';
import 'package:mytasks/src/ui/screens/projectsscreens/projectsscreen/projects_controller.dart';
import 'package:mytasks/src/ui/screens/tasksscreens/addtaskscreen/add_task_controller.dart';
import 'package:mytasks/src/ui/screens/tasksscreens/commentsscreen/comments_controller.dart';
import 'package:mytasks/src/ui/screens/tasksscreens/edittaskscreen/edit_task_controller.dart';
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

    /*---------------------------- App CONTROLLERS -------------------------------*/

    Get.lazyPut<ProjectsController>(() {
      return ProjectsController();
    }, fenix: true);

    Get.create<ProjectDetailsController>(() {
      return ProjectDetailsController();
    });

    Get.create<AddTaskController>(() {
      return AddTaskController();
    });
    Get.create<CommentsController>(() {
      return CommentsController();
    });
    Get.create<EditTaskController>(() {
      return EditTaskController();
    });

    /*---------------------------- SHOPS CONTROLLERS -------------------------------*/


  }
}
