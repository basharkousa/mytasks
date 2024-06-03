import '../section_model.dart';

/// sections : [{"id":"157148942","project_id":"2300344346","order":2,"name":"Todo"},{"id":"157149107","project_id":"2300344346","order":3,"name":"InProgress"},{"id":"157148833","project_id":"2300344346","order":4,"name":"Completed"}]

class SectionsResponse {
  SectionsResponse({
      this.sections,});

  SectionsResponse.fromJson(dynamic json) {
    if (json != null) {
      sections = [];
      json.forEach((v) {
        sections?.add(SectionModel.fromJson(v));
      });
    }
  }
  List<SectionModel>? sections;
SectionsResponse copyWith({  List<SectionModel>? sections,
}) => SectionsResponse(  sections: sections ?? this.sections,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (sections != null) {
      map['sections'] = sections?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}