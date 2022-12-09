import 'package:dio/dio.dart';
import 'package:out_of_bounds/networking/clients/test_client.dart';
import 'package:out_of_bounds/utils/app_constants.dart';

class RetrofitController {
  final Dio _dio = Dio();
  final String baseUrl;

  TestClient? _testClient;

  RetrofitController({this.baseUrl = AppConstants.baseUrl}) {
    _addInterceptor();
  }

  TestClient testClient() {
    _testClient ??= TestClient(_dio, baseUrl: baseUrl);
    return _testClient!;
  }

  void _addInterceptor() {
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      error: true,
      request: true,
      responseBody: true,
    ));
  }

  void _addHeaders() {
    _dio.options.headers["content-type"] = "application/json";
  }
}
