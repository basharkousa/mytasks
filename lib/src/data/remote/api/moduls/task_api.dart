import 'package:dio/dio.dart';
import 'package:mytasks/src/data/models/projectsmodels/project_model.dart';
import 'package:mytasks/src/data/models/sectionsmodels/section_model.dart';
import 'package:mytasks/src/data/models/tasksmodels/task_form_model.dart';
import 'package:mytasks/src/data/models/tasksmodels/tasksresponse/task_model.dart';
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
      "project_id": project?.id,
      "section_id": section?.id,
    };
    queryParameters.removeWhere((key, value) => value == null);
    final res =
        await _dioClient.get(Endpoints.tasks, queryParameters: queryParameters);
    return TasksResponse.fromJson(res);
  }

  Future<TaskModel> postTaskRequest(TaskForm taskForm) async {
    FormData data = FormData.fromMap({
      "project_id": taskForm.projectId,
      "section_id": taskForm.sectionId,
      "content": taskForm.content,
      "description": taskForm.description,
      // "order":1,
      // "due_string": "tomorrow at 12:00",
      "due_lang": "en",
      // "priority": taskForm.priority,
      "due_date": taskForm.dueDate, // "YYYY-MM-DD"
      // "due_datetime": ""
      //Specific date and time in RFC3339 format in UTC.
      //Please note that only one of the due_* fields can be used at the same time (due_lang is a special case).
      // "duration": taskForm.duration,
      //A positive (greater than zero) integer for the amount of duration_unit the task will take. If specified, you must define a duration_unit.
      // "duration_unit": taskForm.durationUnit
      //The unit of time that the duration field above represents. Must be either minute or day. If specified, duration must be defined as well.
    });
    data.fields.removeWhere((element) => element.value == null);
    print("${data.fields}");
    final res = await _dioClient.post(Endpoints.tasks, data: data);
    return TaskModel.fromJson(res);
  }

  Future<TaskModel> updateTaskRequest({TaskForm? taskForm, var taskId}) async {
    FormData data = FormData.fromMap({
      "project_id": taskForm?.projectId,
      "section_id": taskForm?.sectionId,
      "content": taskForm?.content,
      "description": taskForm?.description,
      // "due_string": "tomorrow at 12:00",
      "due_lang": "en",
      // "priority": taskForm?.priority,
      "due_date": taskForm?.dueDate, // "YYYY-MM-DD"
      // "due_datetime": ""
      //Specific date and time in RFC3339 format in UTC.
      //Please note that only one of the due_* fields can be used at the same time (due_lang is a special case).
      // "duration": taskForm?.duration,
      //A positive (greater than zero) integer for the amount of duration_unit the task will take. If specified, you must define a duration_unit.
      // "duration_unit": taskForm?.durationUnit
      //The unit of time that the duration field above represents. Must be either minute or day. If specified, duration must be defined as well.
    });
    data.fields.removeWhere((element) => element.value == null);
    print("${data.fields}");
    final res = await _dioClient.post("${Endpoints.tasks}/${taskId??""}", data: data);
    return TaskModel.fromJson(res);
  }

  Future<String> deleteTaskRequest(var taskId) async {
    final res = await _dioClient.delete("${Endpoints.tasks}/${taskId??""}");
    return res;
  }

}
