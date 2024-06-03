import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mytasks/src/data/models/api_state.dart';
import 'package:mytasks/src/data/models/projectsmodels/project_model.dart';
import 'package:mytasks/src/data/models/sectionsmodels/sectionsresponse/sections_response.dart';
import 'package:mytasks/src/data/repository.dart';

// with SingleGetTickerProviderMixin
class ProjectDetailsController extends GetxController{

  final Repository repository = Get.find();

  ProjectModel project = Get.arguments;

  ProjectDetailsController();

  var sectionsResponseLiveData = ApiState<SectionsResponse>.loading().obs;
  getSections() {
    repository.getSections(project).listen((event) {
      sectionsResponseLiveData.value = event;
      switch(sectionsResponseLiveData.value.status){
        
        case Status.LOADING:
          break;
        case Status.COMPLETED:
          createSections(sectionsResponseLiveData.value.data);
          break;
        case Status.ERROR:
          break;
      }
    });
  }

  final AppFlowyBoardController appFlowyController = AppFlowyBoardController(

    onMoveGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
      // debugPrint('Move item from $fromIndex to $toIndex');
    },
    onMoveGroupItem: (groupId, fromIndex, toIndex) {
      // debugPrint('Move $groupId:$fromIndex to $groupId:$toIndex');
    },
    onMoveGroupItemToGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
      // debugPrint('Move $fromGroupId:$fromIndex to $toGroupId:$toIndex');
    },
  );


  @override
  void onInit() {
    appFlowyController.enableGroupDragging(false);
    getSections();

   /* final group1 = AppFlowyGroupData(
        id: "ToDo",
        name: "To Do",
        items: [
      TaskItemFlowy("Card 1"),
      TaskItemFlowy("Card 2"),
    ]);
    final group2 = AppFlowyGroupData(id: "InProgress", name: "In Progress",
        items: [
      TaskItemFlowy("Card 3"),
      TaskItemFlowy("Card 4"),

    ]);
    final group3 = AppFlowyGroupData(id: "Done",name: "Done",
        items: []);

    appFlowyController.addGroup(group1);
    appFlowyController.addGroup(group2);
    appFlowyController.addGroup(group3);*/
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> onRefresh() async{

  }

  void createSections(SectionsResponse? data) {
    data?.sections?.forEach((section){
      final group = AppFlowyGroupData(
          id: "${section.name}",
          name: "${section.name}",
          items: [
            TaskItemFlowy("Card 1"),
            TaskItemFlowy("Card 2"),
          ]);
      appFlowyController.addGroup(group);

    });
  }
}

class TaskItemFlowy extends AppFlowyGroupItem {
  final String s;
  TaskItemFlowy(this.s);

  @override
  String get id => s;
}