import 'task_model.dart';

/// tasks : [{"id":"8049021220","assigner_id":null,"assignee_id":null,"project_id":"2300344346","section_id":"157148942","parent_id":null,"order":4,"content":"Task6","description":"Due Desccreption Due DesccreptionDue DesccreptionDue DesccreptionDue DesccreptionDue DesccreptionDue DesccreptionDue Desccreption","is_completed":false,"labels":["read"],"priority":1,"comment_count":0,"creator_id":"41431080","created_at":"2024-06-03T15:01:56.542405Z","due":{"date":"2024-06-11","string":"Jun 11","lang":"en","is_recurring":false},"url":"https://todoist.com/app/task/8049021220","duration":null}]

class TasksResponse {
  TasksResponse({
      this.tasks,});

  TasksResponse.fromJson(dynamic json) {
    if (json != null) {
      tasks = [];
      json.forEach((v) {
        tasks?.add(TaskModel.fromJson(v));
      });
    }
  }
  List<TaskModel>? tasks;
TasksResponse copyWith({  List<TaskModel>? tasks,
}) => TasksResponse(  tasks: tasks ?? this.tasks,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (tasks != null) {
      map['tasks'] = tasks?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}