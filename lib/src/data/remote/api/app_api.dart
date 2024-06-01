import 'dart:async';
import 'package:mytasks/src/data/models/projectsmodels/projectsresponse/projects_response.dart';
import 'package:mytasks/src/data/remote/constants/endpoints.dart';

import '../../remote/api/clients/dio_client.dart';
import '../../remote/api/clients/rest_client.dart';

class AppApi{
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  AppApi(this._dioClient, this._restClient);

  //Todo Examples here for calling apis

  Future<ProjectsResponse> getProjectsRequest() async {
    Map<String, dynamic> queryParameters = {
      // "field": jsonEncode(['name', 'email']),
    };
    final res = await _dioClient.get(Endpoints.projects,
        queryParameters: queryParameters);
    // final body = json.decode(res);
    return ProjectsResponse.fromJson(res);
  }

}
