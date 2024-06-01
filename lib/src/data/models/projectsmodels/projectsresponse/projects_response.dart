import '../project_model.dart';

/// projects : [{"id":"2300344308","parent_id":null,"order":0,"color":"grey","name":"Inbox","comment_count":0,"is_shared":false,"is_favorite":false,"is_inbox_project":true,"is_team_inbox":false,"url":"https://todoist.com/showProject?id=2300344308","view_style":"list"},{"id":"2300344344","parent_id":null,"order":1,"color":"grey","name":"Work 🎯","comment_count":0,"is_shared":false,"is_favorite":false,"is_inbox_project":false,"is_team_inbox":false,"url":"https://todoist.com/showProject?id=2300344344","view_style":"list"},{"id":"2300344345","parent_id":null,"order":2,"color":"grey","name":"Education 📚","comment_count":0,"is_shared":false,"is_favorite":false,"is_inbox_project":false,"is_team_inbox":false,"url":"https://todoist.com/showProject?id=2300344345","view_style":"list"},{"id":"2300344346","parent_id":null,"order":3,"color":"grey","name":"Personal 🙂","comment_count":0,"is_shared":false,"is_favorite":false,"is_inbox_project":false,"is_team_inbox":false,"url":"https://todoist.com/showProject?id=2300344346","view_style":"list"}]

class ProjectsResponse{
  ProjectsResponse({
      this.projects,});

  ProjectsResponse.fromJson(dynamic json) {
    if (json != null) {
      projects = [];
      json.forEach((v) {
        projects?.add(ProjectModel.fromJson(v));
      });
    }
  }
  List<ProjectModel>? projects;
ProjectsResponse copyWith({  List<ProjectModel>? projects,
}) => ProjectsResponse(  projects: projects ?? this.projects,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (projects != null) {
      map['projects'] = projects?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}