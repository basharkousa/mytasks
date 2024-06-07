import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mytasks/src/data/models/api_state.dart';
import 'package:mytasks/src/data/models/commentsmodels/commentsresponse/comment_model.dart';
import 'package:mytasks/src/data/models/commentsmodels/commentsresponse/comments_response.dart';
import 'package:mytasks/src/data/models/tasksmodels/tasksresponse/task_model.dart';
import 'package:mytasks/src/data/repository.dart';

// with SingleGetTickerProviderMixin
class CommentsController extends GetxController{

  final Repository repository = Get.find();
  final form = GlobalKey<FormState>();
  TextEditingController taskCommentEditingController = TextEditingController();


  CommentsController();

  TaskModel taskModel = Get.arguments;

  CommentModel commentForm = CommentModel();

  var commentsResponseLiveData = ApiState<CommentsResponse>.loading().obs;
  getComments() {
    repository.getComments(taskModel).listen((event) {
      commentsResponseLiveData.value = event;
    });
  }

  var postCommentsResponseLiveData = ApiState<CommentModel>.completed(null).obs;
  postComment() {
    commentForm.projectId = taskModel.projectId;
    commentForm.taskId = taskModel.id;
    taskCommentEditingController.text = "";
    repository.postComment(commentForm).listen((event) {
      postCommentsResponseLiveData.value = event;
      switch(postCommentsResponseLiveData.value.status){
        case Status.LOADING:
          break;
        case Status.COMPLETED:
          taskCommentEditingController.text = "";
          getComments();
          break;
        case Status.ERROR:
          break;
      }
    });
  }

  @override
  void onInit() {
    getComments();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> onRefresh() async{
    getComments();
  }

}