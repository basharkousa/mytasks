/// date : "2024-06-11"
/// string : "Jun 11"
/// lang : "en"
/// is_recurring : false

class DueModel {
  DueModel({
      this.date, 
      this.string, 
      this.lang, 
      this.isRecurring,});

  DueModel.fromJson(dynamic json) {
    date = json['date'];
    string = json['string'];
    lang = json['lang'];
    isRecurring = json['is_recurring'];
  }
  String? date;
  String? string;
  String? lang;
  bool? isRecurring;
DueModel copyWith({  String? date,
  String? string,
  String? lang,
  bool? isRecurring,
}) => DueModel(  date: date ?? this.date,
  string: string ?? this.string,
  lang: lang ?? this.lang,
  isRecurring: isRecurring ?? this.isRecurring,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = date;
    map['string'] = string;
    map['lang'] = lang;
    map['is_recurring'] = isRecurring;
    return map;
  }

}