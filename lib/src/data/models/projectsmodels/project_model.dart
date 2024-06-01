/// id : "2300344308"
/// parent_id : null
/// order : 0
/// color : "grey"
/// name : "Inbox"
/// comment_count : 0
/// is_shared : false
/// is_favorite : false
/// is_inbox_project : true
/// is_team_inbox : false
/// url : "https://todoist.com/showProject?id=2300344308"
/// view_style : "list"

class ProjectModel {
  ProjectModel({
      this.id, 
      this.parentId, 
      this.order, 
      this.color, 
      this.name, 
      this.commentCount, 
      this.isShared, 
      this.isFavorite, 
      this.isInboxProject, 
      this.isTeamInbox, 
      this.url, 
      this.viewStyle,});

  ProjectModel.fromJson(dynamic json) {
    id = json['id'];
    parentId = json['parent_id'];
    order = json['order'];
    color = json['color'];
    name = json['name'];
    commentCount = json['comment_count'];
    isShared = json['is_shared'];
    isFavorite = json['is_favorite'];
    isInboxProject = json['is_inbox_project'];
    isTeamInbox = json['is_team_inbox'];
    url = json['url'];
    viewStyle = json['view_style'];
  }
  String? id;
  dynamic parentId;
  int? order;
  String? color;
  String? name;
  int? commentCount;
  bool? isShared;
  bool? isFavorite;
  bool? isInboxProject;
  bool? isTeamInbox;
  String? url;
  String? viewStyle;
ProjectModel copyWith({  String? id,
  dynamic parentId,
  int? order,
  String? color,
  String? name,
  int? commentCount,
  bool? isShared,
  bool? isFavorite,
  bool? isInboxProject,
  bool? isTeamInbox,
  String? url,
  String? viewStyle,
}) => ProjectModel(  id: id ?? this.id,
  parentId: parentId ?? this.parentId,
  order: order ?? this.order,
  color: color ?? this.color,
  name: name ?? this.name,
  commentCount: commentCount ?? this.commentCount,
  isShared: isShared ?? this.isShared,
  isFavorite: isFavorite ?? this.isFavorite,
  isInboxProject: isInboxProject ?? this.isInboxProject,
  isTeamInbox: isTeamInbox ?? this.isTeamInbox,
  url: url ?? this.url,
  viewStyle: viewStyle ?? this.viewStyle,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['parent_id'] = parentId;
    map['order'] = order;
    map['color'] = color;
    map['name'] = name;
    map['comment_count'] = commentCount;
    map['is_shared'] = isShared;
    map['is_favorite'] = isFavorite;
    map['is_inbox_project'] = isInboxProject;
    map['is_team_inbox'] = isTeamInbox;
    map['url'] = url;
    map['view_style'] = viewStyle;
    return map;
  }

}