class Result {
    var company_id;
    var contact_id;
    var user_id;

    Result({this.company_id, this.contact_id, this.user_id});

    factory Result.fromJson(Map<String, dynamic> json) {
        return Result(
            company_id: json['company_id'], 
            contact_id: json['contact_id'], 
            user_id: json['user_id'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['company_id'] = company_id;
        data['contact_id'] = contact_id;
        data['user_id'] = user_id;
        return data;
    }
}