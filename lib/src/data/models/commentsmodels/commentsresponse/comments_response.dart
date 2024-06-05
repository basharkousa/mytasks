import 'comment_model.dart';

/// comments : [{"content":"Need one bottle of milk","id":"2992679862","posted_at":"2016-09-22T07:00:00.000000Z","project_id":null,"task_id":"2995104339","attachment":{"file_name":"File.pdf","file_type":"application/pdf","file_url":"https://cdn-domain.tld/path/to/file.pdf","resource_type":"file"}}]

class CommentsResponse {
  CommentsResponse({
      this.comments,});

  CommentsResponse.fromJson(dynamic json) {
    if (json != null) {
      comments = [];
      json.forEach((v) {
        comments?.add(CommentModel.fromJson(v));
      });
    }
  }
  List<CommentModel>? comments;
CommentsResponse copyWith({  List<CommentModel>? comments,
}) => CommentsResponse(  comments: comments ?? this.comments,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (comments != null) {
      map['comments'] = comments?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}