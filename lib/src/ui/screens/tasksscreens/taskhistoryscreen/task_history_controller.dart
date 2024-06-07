import 'package:get/get.dart';
import 'package:mytasks/src/data/models/api_state.dart';
import 'package:mytasks/src/data/models/tasksmodels/tasksresponse/task_model.dart';
import 'package:mytasks/src/data/repository.dart';

// with SingleGetTickerProviderMixin
class TaskHistoryController extends GetxController{

  final Repository repository = Get.find();


  TaskHistoryController();


  RxList<TaskModel> taskHistoryList = <TaskModel>[].obs;
  getTaskHistory() async{
    List<TaskModel>? list =  await repository.getTaskHistoryList();
    print("taskHistoryList ${list?.length}");
    taskHistoryList.clear();
    taskHistoryList.addAll(list?.reversed??[]);
  }

  clearTaskHistory() async{
    void clearResult =  await repository.clearTaskHistoryList();
    getTaskHistory();
  }

  @override
  void onInit() {
    getTaskHistory();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> onRefresh() async{
    getTaskHistory();
  }

}