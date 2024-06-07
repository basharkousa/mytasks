import 'dart:ui';
import 'package:mytasks/src/data/models/commentsmodels/commentsresponse/comment_model.dart';
import 'package:mytasks/src/data/models/commentsmodels/commentsresponse/comments_response.dart';
import 'package:mytasks/src/data/models/projectsmodels/project_model.dart';
import 'package:mytasks/src/data/models/projectsmodels/projectsresponse/projects_response.dart';
import 'package:mytasks/src/data/models/sectionsmodels/section_model.dart';
import 'package:mytasks/src/data/models/sectionsmodels/sectionsresponse/sections_response.dart';
import 'package:mytasks/src/data/models/tasksmodels/task_form_model.dart';
import 'package:mytasks/src/data/models/tasksmodels/tasksresponse/task_model.dart';
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

  Stream<ApiState<TaskModel>> postTask(TaskForm taskForm) async * {
    yield ApiState.loading();
    yield await safeApiCall(() => _remoteDataSource.postTask(taskForm));
  }

  Stream<ApiState<TaskModel>> updateTask({TaskForm? taskForm, var taskId}) async * {
    yield ApiState.loading();
    yield await safeApiCall(() => _remoteDataSource.updateTask(taskForm:taskForm,taskId:taskId));
  }

  Stream<ApiState<String>> deleteTask(var taskId) async * {
    yield ApiState.loading();
    yield await safeApiCall(() => _remoteDataSource.deleteTask(taskId));
  }

  Stream<ApiState<CommentsResponse>> getComments(TaskModel task) async * {
    yield ApiState.loading();
    yield await safeApiCall(() => _remoteDataSource.getComments(task));
  }

  Stream<ApiState<CommentModel>> postComment(CommentModel comment) async * {
    yield ApiState.loading();
    yield await safeApiCall(() => _remoteDataSource.postComment(comment));
  }



  /* --------------------------------SHARED_PREFERENCES METHODS------------------------------------- */

  Future<Locale> get fetchLocale => _localDataSource!.fetchLocale;

  Future<User> getUser() => _localDataSource!.getUser();

  Future<void> saveUser(User user) => _localDataSource!.saveUser(user);

  Future<void> removeUser() => _localDataSource!.removeUser();

  Future<List<String>> get getSearchHistoryList =>
      _localDataSource!.getSearchHistoryList;

  Future<void> saveSearchQuery(String query) async => _localDataSource?.saveSearchQuery(query);

  /* --------------------------------DATABASE METHODS------------------------------------- */

  Future<List<TaskModel>>? getTaskHistoryList() =>
      _localDataSource?.getTaskHistoryList();

  Future<void>? clearTaskHistoryList() =>
      _localDataSource?.clearTaskHistoryList();


  Future<void>? addTaskHistoryItem(TaskModel task) =>
      _localDataSource?.addTaskHistoryItem(task);

  // .......

}
