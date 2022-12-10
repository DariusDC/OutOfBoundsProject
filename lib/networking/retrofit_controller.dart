import 'package:dio/dio.dart';
import 'package:out_of_bounds/networking/clients/auth_client.dart';
import 'package:out_of_bounds/utils/app_constants.dart';

class RetrofitController {
  final Dio _dio = Dio();
  final String baseUrl;

  AuthClient? _authClient;

  RetrofitController({this.baseUrl = AppConstants.baseUrl}) {
    _addInterceptor();
  }

  AuthClient authClient() {
    _authClient ??= AuthClient(_dio, baseUrl: baseUrl);
    return _authClient!;
  }

  void _addInterceptor() {
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      error: true,
      request: true,
      responseBody: true,
    ));
    _addHeaders();
  }

  void _addHeaders() {
    _dio.options.headers["content-type"] = "application/json";
  }
}
