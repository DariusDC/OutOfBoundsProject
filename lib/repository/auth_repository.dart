import 'package:out_of_bounds/model/session.dart';
import 'package:out_of_bounds/model/ui_model.dart';
import 'package:out_of_bounds/model/user_response.dart';
import 'package:out_of_bounds/networking/retrofit_controller.dart';
import 'package:out_of_bounds/repository/shared_preferences_repository.dart';
import 'package:out_of_bounds/screens/login/login_view_model.dart';
import 'package:out_of_bounds/screens/register/register_view_model.dart';

class AuthRepository {
  final RetrofitController _retrofitController;
  final SharedPreferencesRepository _sharedPreferencesRepository;

  AuthRepository(
      {RetrofitController? retrofitController,
      SharedPreferencesRepository? sharedPreferencesRepository})
      : _retrofitController = retrofitController ?? RetrofitController(),
        _sharedPreferencesRepository =
            sharedPreferencesRepository ?? SharedPreferencesRepository();

  Stream<UIModel<UserResponse>> login(UserLogin userLogin) async* {
    yield UIModel.loading();

    try {
      final client = _retrofitController.authClient();
      UserResponse result = await client.login(userLogin);
      await _sharedPreferencesRepository
          .cache(Session(authToken: result.accessToken))
          .first;
      yield UIModel.success(result);
    } catch (e) {
      yield UIModel.error(e);
    }
  }

  Stream<UIModel<UserResponse>> register(UserRegister userRegister) async* {
    yield UIModel.loading();

    try {
      final client = _retrofitController.authClient();
      UserResponse result = await client.register(userRegister);
      await _sharedPreferencesRepository
          .cache(Session(authToken: result.accessToken))
          .first;
      yield UIModel.success(result);
    } catch (e) {
      yield UIModel.error(e);
    }
  }

  Stream<bool> logout() => _sharedPreferencesRepository.remove("token");
}
