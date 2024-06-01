import 'package:dio/dio.dart';
import '../../data/models/api_response.dart';
import '../../data/models/state_result.dart';
import '../remote/exceptions/dio_error_util.dart';

abstract class BaseApiResponse {

  Future<StateResult<T>> safeApiCallNew<T>(Future<T> Function() apiCall) async {
    try {
      var response = await apiCall();
      if (response != null) return SuccessState(response);
      return ErrorState("some Error");
    } on DioException catch (error, stacktrace) {
      print("DioException: $error ---$stacktrace");
      return ErrorState(DioErrorUtil.handleError(error));
    } catch (error, stacktrace) {
      print("Error: $error ---$stacktrace");
      return ErrorState(error.toString());
    }
  }

  Future<ApiResponse<T>> safeApiCall<T>(Future<T> Function() apiCall) async {
    try {
      var response = await apiCall();
      if (response != null) return ApiResponse.completed(response);
      return ApiResponse.error("some Error");
    } on DioException catch (error, stacktrace) {
      print(stacktrace);
      return ApiResponse.error(DioErrorUtil.handleError(error));
    } catch (error, stacktrace) {
      print('Error: $stacktrace');
      return ApiResponse.error(error.toString());
    }
  }

}
