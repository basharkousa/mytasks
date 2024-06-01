class ErrorScrapModel {
    String? error;
    String? error_descrip;

    ErrorScrapModel({this.error, this.error_descrip});

    factory ErrorScrapModel.fromJson(Map<String, dynamic> json) {
        return ErrorScrapModel(
            error: json['error'], 
            error_descrip: json['error_descrip'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['error'] = error;
        data['error_descrip'] = error_descrip;
        return data;
    }
}