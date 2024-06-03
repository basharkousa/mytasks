import 'package:get/get.dart';
import 'package:mytasks/src/data/models/api_state.dart';
import 'package:mytasks/src/data/models/projectsmodels/project_model.dart';
import 'package:mytasks/src/data/models/projectsmodels/projectsresponse/projects_response.dart';
import 'package:mytasks/src/data/repository.dart';
import 'package:mytasks/src/ui/screens/projectsscreens/projectdetailsscreen/project_details_screen.dart';

// with SingleGetTickerProviderMixin
class CommentsController extends GetxController{

  final Repository repository = Get.find();

  CommentsController();

  var projectsResponseLiveData = ApiState<ProjectsResponse>.loading().obs;
  getProjects() {
    repository.getProjectsEasyWay().listen((event) {
      projectsResponseLiveData.value = event;
    });
  }

  @override
  void onInit() {
    getProjects();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> onRefresh() async{
    getProjects();
  }

  void goToProjectDetailsScreen(ProjectModel project) {
    Get.toNamed(ProjectDetailsScreen.route,arguments: project);
  }
}