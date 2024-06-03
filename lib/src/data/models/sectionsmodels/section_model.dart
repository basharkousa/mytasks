import 'package:get/get.dart';
import 'package:mytasks/src/data/models/api_state.dart';
import 'package:mytasks/src/data/models/tasksmodels/tasksresponse/tasks_response.dart';

/// id : "157148942"
/// project_id : "2300344346"
/// order : 2
/// name : "Todo"

class SectionModel {
  SectionModel({
      this.id, 
      this.projectId, 
      this.order, 
      this.name,});

  SectionModel.fromJson(dynamic json) {
    id = json['id'];
    projectId = json['project_id'];
    order = json['order'];
    name = json['name'];
  }
  String? id;
  String? projectId;
  int? order;
  String? name;
  var tasksResponseLiveData = ApiState<TasksResponse>.loading().obs;

  SectionModel copyWith({  String? id,
  String? projectId,
  int? order,
  String? name,
}) => SectionModel(  id: id ?? this.id,
  projectId: projectId ?? this.projectId,
  order: order ?? this.order,
  name: name ?? this.name,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['project_id'] = projectId;
    map['order'] = order;
    map['name'] = name;
    return map;
  }

}