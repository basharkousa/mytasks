import 'dart:async';
import 'dart:convert';
import '../../remote/api/clients/dio_client.dart';
import '../../remote/api/clients/rest_client.dart';

class ScrapApi{
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  ScrapApi(this._dioClient, this._restClient);

  //Todo Examples here for calling apis

/*  Future<CompaniesResponse> getCompaniesRequest() async {
    Map<String, dynamic> queryParameters = {
      "field": jsonEncode(['name', 'email']),
    };
    final res = await _dioClient.get(Endpoints.getCompanies,
        queryParameters: queryParameters);
    //Map<String, dynamic> jsonRes = jsonEncode(res);
    final body = json.decode(res);

    return CompaniesResponse.fromJson(body);
  }

  Future<CountryResponse> getCountriesRequest() async {
    final res = await _dioClient.get(Endpoints.getCountriesOfActiveCompanies);
    //final body = json.decode(res);
    return CountryResponse.fromJson(res);
  }


  Future<GetTermsResponse> getTermsRequest() async {
    Map<String, dynamic> queryParameters = {};
    final res = await _dioClient.get(Endpoints.getHeadquarterGeneralInfo,
        queryParameters: queryParameters);
    //final body = json.decode(res);
    return GetTermsResponse.fromJson(res);
  }*/

}
