import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../exceptions/network_exceptions.dart';

class RestClient {

  // instantiate json decoder for json serialization
  final JsonDecoder _decoder = const JsonDecoder();

  // Get:-----------------------------------------------------------------------
  Future<dynamic> get(String url) {
    return http.get(Uri.parse(url)).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400) {
        throw NetworkException(
            message: "Error fetching data from server", statusCode: statusCode);
      }

      print(res);
      return _decoder.convert(res);
    });
  }

  // Post:----------------------------------------------------------------------
  Future<dynamic> post(var url, {dynamic headers, body, encoding}) {
    return http
        .post(url, body: body, headers: headers, encoding: encoding)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400) {
        throw NetworkException(
            message: "Error fetching data from server", statusCode: statusCode);
      }
      return _decoder.convert(res);
    });
  }
}
