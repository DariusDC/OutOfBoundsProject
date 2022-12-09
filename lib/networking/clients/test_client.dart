import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'test_client.g.dart';

@RestApi()
abstract class TestClient {
  factory TestClient(Dio dio, {String baseUrl}) = _TestClient;

  @GET("/hello")
  Future<String> getHelloWorld();
}
