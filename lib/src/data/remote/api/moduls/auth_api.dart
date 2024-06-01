import 'package:dio/dio.dart';
import '../../../models/authmodels/signupresponse/signup_respose.dart';
import '../../constants/endpoints.dart';
import '../../../models/user/user.dart';
import '../../api/clients/dio_client.dart';
import '../clients/rest_client.dart';

class AuthApi {
  // dio instance
  final DioClient _dioClient;
  DioClient get dioClient => _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  AuthApi(this._dioClient, this._restClient);

  //Todo Examples here for calling apis related to auth module

  Future<SignUpResponse> loginNormalRequest(User user) async {
    FormData data = FormData.fromMap({
      "username": user.email,
      "password": user.password,
    });
    print("LoginNormalRequest_${data.fields.toString()}");
    final res = await _dioClient.post(Endpoints.logIn, data: data);
    print(res);
    return SignUpResponse.fromJson(res);
  }

  Future<SignUpResponse> signUpRequest(User userInfo) async {
    FormData data = FormData.fromMap({
      "name": userInfo.name,
      "last_name": userInfo.lastName,
      "login": userInfo.email,
      "password": userInfo.password,
      // "dob": "2020-10-11",
      "gender": "male",
      "is_designer": 0,
      "profession": "",
      "mobile": userInfo.mobile,
    });
    print("User Data is ${data.fields}");
    final res = await _dioClient.post(Endpoints.signUp, data: data);
    //final body = json.decode(res);
    return SignUpResponse.fromJson(res);
  }


}
