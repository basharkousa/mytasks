import 'package:dio/dio.dart';
import 'package:mytasks/src/data/models/commentsmodels/commentsresponse/comment_model.dart';
import 'package:mytasks/src/data/models/commentsmodels/commentsresponse/comments_response.dart';
import 'package:mytasks/src/data/models/projectsmodels/project_model.dart';
import 'package:mytasks/src/data/models/sectionsmodels/section_model.dart';
import 'package:mytasks/src/data/models/tasksmodels/task_form_model.dart';
import 'package:mytasks/src/data/models/tasksmodels/tasksresponse/task_model.dart';
import 'package:mytasks/src/data/models/tasksmodels/tasksresponse/tasks_response.dart';
import '../../constants/endpoints.dart';
import '../../api/clients/dio_client.dart';
import '../clients/rest_client.dart';

class CommentApi {
  // dio instance
  final DioClient _dioClient;

  DioClient get dioClient => _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  CommentApi(this._dioClient, this._restClient);

  Future<CommentsResponse> getCommentsRequest(
      TaskModel taskModel) async {
    Map<String, dynamic> queryParameters = {
      "task_id": taskModel.id,
    };
    queryParameters.removeWhere((key, value) => value == null);
    final res =
    await _dioClient.get(Endpoints.comments, queryParameters: queryParameters);
    return CommentsResponse.fromJson(res);
  }

  Future<CommentModel> postCommentRequest(CommentModel comment) async {
    Map<String,dynamic> data = {
      "task_id": comment.taskId,
      "content": comment.content,
      // "attachment": {
      //   "resource_type": "file",
      //   "file_url": "https://s3.amazonaws.com/domorebetter/Todoist+Setup+Guide.pdf",
      //   "file_type": "application/pdf",
      //   "file_name": "File.pdf"
      // }
    };

    data.removeWhere((key,value) => value == null);
    final res = await _dioClient.post(Endpoints.comments, data: data);
    return CommentModel.fromJson(res);
  }
}
