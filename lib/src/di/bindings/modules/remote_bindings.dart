import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../data/remote/api/clients/dio_client.dart';
import '../../../data/remote/api/clients/rest_client.dart';
import '../../../data/remote/api/moduls/auth_api.dart';
import '../../../data/remote/api/scrap_api.dart';
import '../../../data/remote/constants/endpoints.dart';
import '../../../data/remote/remote_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemoteBindings extends Bindings {

  RemoteBindings();

  @override
  void dependencies() {

    Get.lazyPut<Dio>(() {
      final dio = Dio();
      dio
        ..options.baseUrl = Endpoints.baseUrl
        ..options.connectTimeout =  const Duration(milliseconds: Endpoints.connectionTimeout)
        ..options.receiveTimeout = const Duration(milliseconds: Endpoints.receiveTimeout)
//     ..options.headers = {'Content-Type':'application/json; charset=utf-8'}
//      ..options.responseType = ResponseType.bytes
        ..interceptors.add(LogInterceptor(
            request: true,
            responseBody: true,
            requestBody: true,
            requestHeader: true,
            error: true
        ))
        ..interceptors.add(
          InterceptorsWrapper(
              onRequest: (RequestOptions options,RequestInterceptorHandler handler) async {
                // getting shared pref instance
                var prefs = await SharedPreferences.getInstance();

                // getting token
                // var token = prefs.getString(Preferences.token);
                var token = "Uncomment above when the api is ready";
                // var token = null;
                print("tokenDioInstanse$token ");

                if (token != null) {
                  options.headers.putIfAbsent('Authorization', () => token);
                } else {
                  print('Auth token is null');
                }
                handler.next(options);
              },
              onError: (e, handler) {
                print(e.message);
                handler.next(e);
              },
              onResponse: (r, handler) {
                print(r.data);
                handler.next(r);
              }
          ),

          // InterceptorsWrapper(
          //   onRequest: (Options options) async {
          //     // getting shared pref instance
          //     var prefs = await SharedPreferences.getInstance();
          //
          //     // getting token
          //     var token = prefs.getString(Preferences.odoo_auth_token);
          //     print("token from cleint${token} ");
          //
          //     if (token != null) {
          //       options.headers.putIfAbsent('Authorization', () => token);
          //       //for test if user's token has expired.
          //       //options.headers.putIfAbsent('Authorization', () => '271slrvd5Fc2a7uB3QEjnw6i8Qoxed');
          //     } else {
          //       print('Auth token is null');
          //     }
          //   },
          // ),
        );

      return dio;
    },fenix: true);

    Get.lazyPut<DioClient>(() {
      return DioClient(Get.find());
    },fenix: true);

    Get.lazyPut<RestClient>(() {
      return RestClient();
    },fenix: true);

    Get.lazyPut<ScrapApi>(() {
      return ScrapApi(Get.find(),Get.find());
    },fenix: true);

    Get.lazyPut<AuthApi>(() {
      return AuthApi(Get.find(),Get.find());
    },fenix: true);

    Get.lazyPut<RemoteDataSource>(() {
      return RemoteDataSource(
          Get.find<ScrapApi>(),
          Get.find<AuthApi>(),
          );
    }, fenix: true);

  }
}