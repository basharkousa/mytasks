import 'package:get/get.dart';
import 'package:mytasks/src/data/local/datasources/database/constants/db_constants.dart';
import 'package:mytasks/src/data/models/api_state.dart';

import 'due_model.dart';

/// id : "8049021220"
/// assigner_id : null
/// assignee_id : null
/// project_id : "2300344346"
/// section_id : "157148942"
/// parent_id : null
/// order : 4
/// content : "Task6"
/// description : "Due Desccreption Due DesccreptionDue DesccreptionDue DesccreptionDue DesccreptionDue DesccreptionDue DesccreptionDue Desccreption"
/// is_completed : false
/// labels : ["read"]
/// priority : 1
/// comment_count : 0
/// creator_id : "41431080"
/// created_at : "2024-06-03T15:01:56.542405Z"
/// due : {"date":"2024-06-11","string":"Jun 11","lang":"en","is_recurring":false}
/// url : "https://todoist.com/app/task/8049021220"
/// duration : null

class TaskModel {
  TaskModel({
    this.id,
    this.assignerId,
    this.assigneeId,
    this.projectId,
    this.sectionId,
    this.parentId,
    this.order,
    this.content,
    this.description,
    this.isCompleted,
    this.labels,
    this.priority,
    this.commentCount,
    this.creatorId,
    this.createdAt,
    this.due,
    this.url,
    this.duration,
  });

  TaskModel.fromJson(dynamic json) {
    id = json['id'];
    assignerId = json['assigner_id'];
    assigneeId = json['assignee_id'];
    projectId = json['project_id'];
    sectionId = json['section_id'];
    parentId = json['parent_id'];
    order = json['order'];
    content = json['content'];
    description = json['description'];
    isCompleted = json['is_completed'];
    labels = json['labels'] != null ? json['labels'].cast<String>() : [];
    priority = json['priority'];
    commentCount = json['comment_count'];
    creatorId = json['creator_id'];
    createdAt = json['created_at'];
    due = json['due'] != null ? DueModel.fromJson(json['due']) : null;
    url = json['url'];
    duration = json['duration'];
  }

  String? id;
  dynamic assignerId;
  dynamic assigneeId;
  String? projectId;
  String? sectionId;
  dynamic parentId;
  int? order;
  String? content;
  String? description;
  bool? isCompleted;
  List<String>? labels;
  int? priority;
  int? commentCount;
  String? creatorId;
  String? createdAt;
  DueModel? due;
  String? url;
  dynamic duration;
  var deleteTaskLiveData = ApiState.completed('').obs;
  var spentTime = "0s-0m-0h-0d-0m";

  TaskModel copyWith({
    String? id,
    dynamic assignerId,
    dynamic assigneeId,
    String? projectId,
    String? sectionId,
    dynamic parentId,
    int? order,
    String? content,
    String? description,
    bool? isCompleted,
    List<String>? labels,
    int? priority,
    int? commentCount,
    String? creatorId,
    String? createdAt,
    DueModel? due,
    String? url,
    dynamic duration,
  }) =>
      TaskModel(
        id: id ?? this.id,
        assignerId: assignerId ?? this.assignerId,
        assigneeId: assigneeId ?? this.assigneeId,
        projectId: projectId ?? this.projectId,
        sectionId: sectionId ?? this.sectionId,
        parentId: parentId ?? this.parentId,
        order: order ?? this.order,
        content: content ?? this.content,
        description: description ?? this.description,
        isCompleted: isCompleted ?? this.isCompleted,
        labels: labels ?? this.labels,
        priority: priority ?? this.priority,
        commentCount: commentCount ?? this.commentCount,
        creatorId: creatorId ?? this.creatorId,
        createdAt: createdAt ?? this.createdAt,
        due: due ?? this.due,
        url: url ?? this.url,
        duration: duration ?? this.duration,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['assigner_id'] = assignerId;
    map['assignee_id'] = assigneeId;
    map['project_id'] = projectId;
    map['section_id'] = sectionId;
    map['parent_id'] = parentId;
    map['order'] = order;
    map['content'] = content;
    map['description'] = description;
    map['is_completed'] = isCompleted;
    map['labels'] = labels;
    map['priority'] = priority;
    map['comment_count'] = commentCount;
    map['creator_id'] = creatorId;
    map['created_at'] = createdAt;
    if (due != null) {
      map['due'] = due?.toJson();
    }
    map['url'] = url;
    map['duration'] = duration;
    return map;
  }

  Map<String, Object?> toMapDatabase() {
    final map = <String, dynamic>{};
    map[DBConstants.ID] = id;
    map[DBConstants.PROJECT_ID] = projectId;
    map[DBConstants.SECTION_ID] = sectionId;
    map[DBConstants.CONTENT] =  content;
    map[DBConstants.DESCRIPTIN] = description;
    // map[DBConstants.IS_COMPLETED] = isCompleted;
    map[DBConstants.PRIORITY] = priority;
    map[DBConstants.CREATED_AT] = createdAt;
    map[DBConstants.SPENT_TIME] = spentTime??'';
    return map;
  }

  TaskModel.fromMapDataBase(Map<String, dynamic> map) {
    id = map[DBConstants.ID];
    projectId = map[DBConstants.PROJECT_ID];
    sectionId = map[DBConstants.SECTION_ID];
    content = map[DBConstants.CONTENT];
    description = map[DBConstants.DESCRIPTIN];
    // isCompleted = map[DBConstants.IS_COMPLETED];
    priority = map[DBConstants.PRIORITY];
    createdAt = map[DBConstants.CREATED_AT];
    spentTime = map[DBConstants.SPENT_TIME]??'';
  }
}
