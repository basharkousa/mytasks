import 'package:dio/dio.dart';

class DioErrorUtil {
  // general methods:------------------------------------------------------------

  static String? handleError(DioException error) {
    String? errorDescription = "";
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.cancel:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioExceptionType.connectionTimeout:
          errorDescription = "Connection timeout with API server";
          break;
        case DioExceptionType.unknown:
          errorDescription =
              "Connection to API server failed due to internet connection";
          break;
        case DioExceptionType.receiveTimeout:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioExceptionType.badResponse:
          try {
            //todo we must add Error model which is related to Scrap error response api
/*            ErrorScrapModel errorScrapModel =
            ErrorScrapModel.fromJson(error.response!.data!);
            if (errorScrapModel.error!.contains('invalid_token') || errorScrapModel.error_descrip!.contains('Invalid')) {
              AppController.controller.login();
              print('invalid_token_Please_re');
            }
            // if()
            errorDescription = "${errorScrapModel.error_descrip}";*/
          } catch (error, stacktrace) {
            print("DioExceptionTypeBadResponse $error $stacktrace");
          }
          break;
        case DioExceptionType.sendTimeout:
          errorDescription = "Send timeout in connection with API server";
          break;
        case DioExceptionType.badCertificate:
          errorDescription = "Bad Certificate!!";
          break;
        case DioExceptionType.connectionError:
          errorDescription =
              "Connection to API server failed due to connection error!!";
          break;
      }
    } else {
      errorDescription = "Unexpected error occurred!!";
    }
    return errorDescription;
  }
}
