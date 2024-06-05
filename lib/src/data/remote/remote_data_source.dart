import 'package:mytasks/src/data/models/commentsmodels/commentsresponse/comment_model.dart';
import 'package:mytasks/src/data/models/commentsmodels/commentsresponse/comments_response.dart';
import 'package:mytasks/src/data/models/projectsmodels/project_model.dart';
import 'package:mytasks/src/data/models/projectsmodels/projectsresponse/projects_response.dart';
import 'package:mytasks/src/data/models/sectionsmodels/section_model.dart';
import 'package:mytasks/src/data/models/sectionsmodels/sectionsresponse/sections_response.dart';
import 'package:mytasks/src/data/models/tasksmodels/task_form_model.dart';
import 'package:mytasks/src/data/models/tasksmodels/tasksresponse/task_model.dart';
import 'package:mytasks/src/data/models/tasksmodels/tasksresponse/tasks_response.dart';
import 'package:mytasks/src/data/remote/api/moduls/comment_api.dart';
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
  final CommentApi _commentApi;

  RemoteDataSource(
      this._appApi,
      this._authApi,
      this._sectionApi,
      this._taskApi,
      this._commentApi
);

  Future<ProjectsResponse> getProjects() => _appApi.getProjectsRequest();

  Future<SectionsResponse> getSections(ProjectModel project) => _sectionApi.getSectionsRequest(project);

  Future<TasksResponse> getTasks(
          {ProjectModel? project, SectionModel? section}) => _taskApi.getTasksRequest(project:project,section:section);


  Future<TaskModel> postTask(
      TaskForm taskForm) => _taskApi.postTaskRequest(taskForm);


  Future<TaskModel> updateTask(
      {TaskForm? taskForm, var taskId}) => _taskApi.updateTaskRequest(taskForm:taskForm,taskId:taskId);

  Future<String> deleteTask(
      var taskId) => _taskApi.deleteTaskRequest(taskId);

  Future<CommentsResponse> getComments(
      task) => _commentApi.getCommentsRequest(task);

  Future<CommentModel> postComment(
      CommentModel comment) => _commentApi.postCommentRequest(comment);


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
