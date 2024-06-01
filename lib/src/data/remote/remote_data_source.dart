import 'package:mytasks/src/data/models/projectsmodels/projectsresponse/projects_response.dart';

import '../models/authmodels/signupresponse/signup_respose.dart';
import '../models/user/user.dart';
import 'api/moduls/auth_api.dart';
import 'api/app_api.dart';


class RemoteDataSource {

  final AppApi _appApi;
  final AuthApi _authApi;

  RemoteDataSource(
      this._appApi,
      this._authApi,
);

  Future<ProjectsResponse> getProjects() => _appApi.getProjectsRequest();


  Future<SignUpResponse> doSignUp(User user) => _authApi.signUpRequest(user);

  Future<SignUpResponse> doNormalLogin(User user) =>
      _authApi.loginNormalRequest(user);


//Todo Examples here for calling apis

/* Future<CurrentCountryResponse> getCurrentCountryDetails() =>
      _scrapApi.getCurrentCountryDetail();

  Future<GetTermsResponse> getTerms() => _scrapApi.getTermsRequest();

  Future<CompaniesResponse> getCompanies() => _scrapApi.getCompaniesRequest();

  Future<CountryResponse> getCountries() => _scrapApi.getCountriesRequest();*/


}
