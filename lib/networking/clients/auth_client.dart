import 'package:out_of_bounds/model/user_response.dart';
import 'package:out_of_bounds/screens/login/login_view_model.dart';
import 'package:out_of_bounds/screens/register/register_view_model.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

import '../../model/user.dart';

part 'auth_client.g.dart';

@RestApi()
abstract class AuthClient {
  factory AuthClient(Dio dio, {String baseUrl}) = _AuthClient;

  @POST("/auth/signup")
  Future<UserResponse> register(@Body() UserRegister userRegister);

  @POST("/auth/signin")
  Future<UserResponse> login(@Body() UserLogin userLogin);

  @POST("/student/me")
  Future<User> getUserData();

  @PATCH("/student/me")
  Future<User> updateTechnologies(@Body() User user);
}
