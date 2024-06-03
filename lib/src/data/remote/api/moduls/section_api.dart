import 'package:dio/dio.dart';
import 'package:mytasks/src/data/models/projectsmodels/project_model.dart';
import 'package:mytasks/src/data/models/sectionsmodels/sectionsresponse/sections_response.dart';
import '../../../models/authmodels/signupresponse/signup_respose.dart';
import '../../constants/endpoints.dart';
import '../../../models/user/user.dart';
import '../../api/clients/dio_client.dart';
import '../clients/rest_client.dart';

class SectionApi {
  // dio instance
  final DioClient _dioClient;
  DioClient get dioClient => _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  SectionApi(this._dioClient, this._restClient);

  //Todo Examples here for calling apis related to auth module

  Future<SectionsResponse> getSectionsRequest(ProjectModel project) async {
    Map<String, dynamic> queryParameters = {
      "project_id":project.id
    };
    final res = await _dioClient.get(Endpoints.sections,
        queryParameters: queryParameters);
    return SectionsResponse.fromJson(res);
  }
}
