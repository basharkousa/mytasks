import 'result.dart';

class SignUpResponse {
    Result? result;

    SignUpResponse({this.result});

    factory SignUpResponse.fromJson(Map<String, dynamic> json) {
        return SignUpResponse(
            result: json['result'] != null ? Result.fromJson(json['result']) : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        if (result != null) {
            data['result'] = result!.toJson();
        }
        return data;
    }
}