import 'attachment_model.dart';

/// content : "Need one bottle of milk"
/// id : "2992679862"
/// posted_at : "2016-09-22T07:00:00.000000Z"
/// project_id : null
/// task_id : "2995104339"
/// attachment : {"file_name":"File.pdf","file_type":"application/pdf","file_url":"https://cdn-domain.tld/path/to/file.pdf","resource_type":"file"}

class CommentModel {
  CommentModel({
      this.content, 
      this.id, 
      this.postedAt, 
      this.projectId, 
      this.taskId, 
      this.attachment,});

  CommentModel.fromJson(dynamic json) {
    content = json['content'];
    id = json['id'];
    postedAt = json['posted_at'];
    projectId = json['project_id'];
    taskId = json['task_id'];
    attachment = json['attachment'] != null ? AttachmentModel.fromJson(json['attachment']) : null;
  }
  String? content;
  String? id;
  String? postedAt;
  dynamic projectId;
  String? taskId;
  AttachmentModel? attachment;
CommentModel copyWith({  String? content,
  String? id,
  String? postedAt,
  dynamic projectId,
  String? taskId,
  AttachmentModel? attachment,
}) => CommentModel(  content: content ?? this.content,
  id: id ?? this.id,
  postedAt: postedAt ?? this.postedAt,
  projectId: projectId ?? this.projectId,
  taskId: taskId ?? this.taskId,
  attachment: attachment ?? this.attachment,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['content'] = content;
    map['id'] = id;
    map['posted_at'] = postedAt;
    map['project_id'] = projectId;
    map['task_id'] = taskId;
    if (attachment != null) {
      map['attachment'] = attachment?.toJson();
    }
    return map;
  }

}