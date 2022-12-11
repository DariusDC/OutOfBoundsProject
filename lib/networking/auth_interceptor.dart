import 'package:dio/dio.dart';
import 'package:out_of_bounds/repository/shared_preferences_repository.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final session =
        await SharedPreferencesRepository().getCurrentSession().first;
    options.headers
        .addAll({"Authorization": "Bearer ${session?.authToken ?? ""}"});
    super.onRequest(options, handler);
  }
}
