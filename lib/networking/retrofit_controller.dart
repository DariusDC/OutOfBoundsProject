import 'package:dio/dio.dart';
import 'package:out_of_bounds/model/session.dart';
import 'package:out_of_bounds/model/user.dart';
import 'package:out_of_bounds/networking/auth_interceptor.dart';
import 'package:out_of_bounds/networking/clients/auth_client.dart';
import 'package:out_of_bounds/networking/clients/task_client.dart';
import 'package:out_of_bounds/repository/shared_preferences_repository.dart';
import 'package:out_of_bounds/utils/app_constants.dart';

class RetrofitController {
  final Dio _dio = Dio();
  final String baseUrl;

  AuthClient? _authClient;
  TaskClient? _taskClient;

  RetrofitController({this.baseUrl = AppConstants.baseUrl, Session? session}) {
    _addInterceptor();
  }

  AuthClient authClient() {
    _authClient ??= AuthClient(_dio, baseUrl: baseUrl);
    return _authClient!;
  }

  TaskClient taskClient() {
    _taskClient ??= TaskClient(_dio, baseUrl: baseUrl);
    return _taskClient!;
  }

  void _addInterceptor() {
    _dio.interceptors.add(AuthInterceptor());
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      error: true,
      request: true,
      responseBody: true,
    ));
    _dio.options.headers.addAll(
        {"content-type": "application/json", "Connection": "keep-alive"});
  }
}
