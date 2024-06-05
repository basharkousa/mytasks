import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mytasks/src/data/models/api_state.dart';
import 'package:mytasks/src/data/models/tasksmodels/task_form_model.dart';
import 'package:mytasks/src/data/models/tasksmodels/tasksresponse/task_model.dart';
import 'package:mytasks/src/data/repository.dart';

// with SingleGetTickerProviderMixin
class EditTaskController extends GetxController{

  final Repository repository = Get.find();


  EditTaskController();

  TaskModel taskModel = Get.arguments;

  final form = GlobalKey<FormState>();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode descriptionFocusNode = FocusNode();

  ScrollController scrollController = ScrollController();

  TextEditingController taskTitleEditingController = TextEditingController();
  TextEditingController dueDateEditingController = TextEditingController();
  TextEditingController taskDescriptionEditingController = TextEditingController();

  TaskForm taskForm = TaskForm();

  @override
  void onInit() {
    taskTitleEditingController.text = taskModel.content??"";
    dueDateEditingController.text = taskModel.due?.date ??"";
    taskDescriptionEditingController.text = taskModel.description??"";
    super.onInit();
  }

  @override
  void onClose() {
    descriptionFocusNode.dispose();
    super.onClose();
  }


  Future<void> onRefresh() async{

  }

  var updateTaskResponseLiveData = ApiState<TaskModel>.completed(null).obs;
  void postTask() {
    repository.updateTask(taskForm:taskForm,taskId: taskModel.id).listen((event){
      updateTaskResponseLiveData.value = event;
      switch(updateTaskResponseLiveData.value.status){
        case Status.LOADING:
          break;
        case Status.COMPLETED:
          Get.back(result: updateTaskResponseLiveData.value.data);
          break;
        case Status.ERROR:
          break;
      }
    });
    print(taskForm.toString());
  }
}