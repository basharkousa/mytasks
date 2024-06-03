import 'package:mytasks/src/data/models/projectsmodels/project_model.dart';
import 'package:mytasks/src/data/models/sectionsmodels/section_model.dart';
import 'package:mytasks/src/data/models/tasksmodels/tasksresponse/tasks_response.dart';
import '../../constants/endpoints.dart';
import '../../api/clients/dio_client.dart';
import '../clients/rest_client.dart';

class TaskApi {
  // dio instance
  final DioClient _dioClient;
  DioClient get dioClient => _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  TaskApi(this._dioClient, this._restClient);

  Future<TasksResponse> getTasksRequest(
      {ProjectModel? project, SectionModel? section}) async {
    Map<String, dynamic> queryParameters = {
      "project_id":project?.id,
      "section_id":section?.id,
    };
    queryParameters.removeWhere((key, value) => value == null);
    final res = await _dioClient.get(Endpoints.tasks,
        queryParameters: queryParameters);
    return TasksResponse.fromJson(res);
  }
}
