import 'package:mytasks/src/data/models/projectsmodels/project_model.dart';
import 'package:mytasks/src/data/models/projectsmodels/projectsresponse/projects_response.dart';
import 'package:mytasks/src/data/models/sectionsmodels/section_model.dart';
import 'package:mytasks/src/data/models/sectionsmodels/sectionsresponse/sections_response.dart';
import 'package:mytasks/src/data/models/tasksmodels/tasksresponse/tasks_response.dart';
import 'package:mytasks/src/data/remote/api/moduls/section_api.dart';
import 'package:mytasks/src/data/remote/api/moduls/task_api.dart';

import '../models/authmodels/signupresponse/signup_respose.dart';
import '../models/user/user.dart';
import 'api/moduls/auth_api.dart';
import 'api/app_api.dart';


class RemoteDataSource {

  final AppApi _appApi;
  final AuthApi _authApi;
  final SectionApi _sectionApi;
  final TaskApi _taskApi;

  RemoteDataSource(
      this._appApi,
      this._authApi,
      this._sectionApi,
      this._taskApi
);

  Future<ProjectsResponse> getProjects() => _appApi.getProjectsRequest();

  Future<SectionsResponse> getSections(ProjectModel project) => _sectionApi.getSectionsRequest(project);

  Future<TasksResponse> getTasks(
          {ProjectModel? project, SectionModel? section}) => _taskApi.getTasksRequest(project:project,section:section);


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
