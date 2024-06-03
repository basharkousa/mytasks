import 'dart:ui';

import 'package:mytasks/src/data/models/projectsmodels/project_model.dart';
import 'package:mytasks/src/data/models/projectsmodels/projectsresponse/projects_response.dart';
import 'package:mytasks/src/data/models/sectionsmodels/section_model.dart';
import 'package:mytasks/src/data/models/sectionsmodels/sectionsresponse/sections_response.dart';
import 'package:mytasks/src/data/models/tasksmodels/tasksresponse/tasks_response.dart';

import 'local/local_data_source.dart';
import 'models/api_state.dart';
import 'models/base_api_response.dart';
import 'models/user/user.dart';
import 'remote/remote_data_source.dart';

class Repository extends BaseApiResponse {

  final RemoteDataSource _remoteDataSource;

  final LocalDataSource? _localDataSource;

  Repository(this._remoteDataSource, this._localDataSource);

  /* --------------------------------API METHODS------------------------------------- */

  //I Added to ways to call Api to show the differences between them here and in Controller and why I used Stream instead of Future.

  Future<ProjectsResponse> getProjects() =>
      _remoteDataSource.getProjects();

  Stream<ApiState<ProjectsResponse>> getProjectsEasyWay() async * {
    yield ApiState.loading();
    yield await safeApiCall(() => _remoteDataSource.getProjects());
  }

  Future<SectionsResponse> getSections(ProjectModel project) =>
      _remoteDataSource.getSections(project);

  Future<TasksResponse> getTasks({ProjectModel? project, SectionModel? section}) =>
      _remoteDataSource.getTasks(project:project,section:section);

  /* --------------------------------SHARED_PREFERENCES METHODS------------------------------------- */

  Future<Locale> get fetchLocale => _localDataSource!.fetchLocale;

  Future<User> getUser() => _localDataSource!.getUser();

  Future<void> saveUser(User user) => _localDataSource!.saveUser(user);

  Future<void> removeUser() => _localDataSource!.removeUser();

  Future<List<String>> get getSearchHistoryList =>
      _localDataSource!.getSearchHistoryList;

  Future<void> saveSearchQuery(String query) async => _localDataSource?.saveSearchQuery(query);

  /* --------------------------------DATABASE METHODS------------------------------------- */

  // .......

}
