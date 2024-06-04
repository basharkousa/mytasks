/// content : "Buy Milk"
/// description : ""
/// due_string : "tomorrow at 12:00"
/// due_lang : "en"
/// priority : 4
/// project_id : "section_id"
/// section_id : "section_id"
/// due_date : "YYYY-MM-DD"
/// due_datetime : ""
/// duration : 0
/// duration_unit : ""

class TaskForm {
  TaskForm({
      this.content, 
      this.description, 
      this.dueString, 
      this.dueLang, 
      this.priority, 
      this.projectId, 
      this.sectionId, 
      this.dueDate, 
      this.dueDatetime, 
      this.duration, 
      this.durationUnit,});

  TaskForm.fromJson(dynamic json) {
    content = json['content'];
    description = json['description'];
    dueString = json['due_string'];
    dueLang = json['due_lang'];
    priority = json['priority'];
    projectId = json['project_id'];
    sectionId = json['section_id'];
    dueDate = json['due_date'];
    dueDatetime = json['due_datetime'];
    duration = json['duration'];
    durationUnit = json['duration_unit'];
  }
  String? content;
  String? description;
  String? dueString;
  String? dueLang;
  int? priority;
  String? projectId;
  String? sectionId;
  String? dueDate;
  String? dueDatetime;
  int? duration;
  String? durationUnit;
TaskForm copyWith({  String? content,
  String? description,
  String? dueString,
  String? dueLang,
  int? priority,
  String? projectId,
  String? sectionId,
  String? dueDate,
  String? dueDatetime,
  int? duration,
  String? durationUnit,
}) => TaskForm(  content: content ?? this.content,
  description: description ?? this.description,
  dueString: dueString ?? this.dueString,
  dueLang: dueLang ?? this.dueLang,
  priority: priority ?? this.priority,
  projectId: projectId ?? this.projectId,
  sectionId: sectionId ?? this.sectionId,
  dueDate: dueDate ?? this.dueDate,
  dueDatetime: dueDatetime ?? this.dueDatetime,
  duration: duration ?? this.duration,
  durationUnit: durationUnit ?? this.durationUnit,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['content'] = content;
    map['description'] = description;
    map['due_string'] = dueString;
    map['due_lang'] = dueLang;
    map['priority'] = priority;
    map['project_id'] = projectId;
    map['section_id'] = sectionId;
    map['due_date'] = dueDate;
    map['due_datetime'] = dueDatetime;
    map['duration'] = duration;
    map['duration_unit'] = durationUnit;
    return map;
  }

}