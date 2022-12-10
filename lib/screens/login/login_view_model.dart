import 'package:out_of_bounds/model/ui_model.dart';
import 'package:out_of_bounds/model/user_response.dart';
import 'package:out_of_bounds/repository/auth_repository.dart';
import 'package:rxdart/rxdart.dart';

class LoginViewModel {
  final Input input;
  late Output output;
  final AuthRepository _authRepository;

  LoginViewModel(this.input, {AuthRepository? authRepository})
      : _authRepository = authRepository ?? AuthRepository() {
    output = Output(
      input.login.flatMap(
        (value) => _authRepository.login(value.username, value.password),
      ),
    );
  }
}

class Input {
  final Subject<UserLogin> login;

  Input(this.login);
}

class Output {
  final Stream<UIModel<UserResponse>> onLogin;

  Output(this.onLogin);
}

class UserLogin {
  final String username;
  final String password;

  UserLogin(this.username, this.password);

  Map<String, dynamic> toJson() => {"username": username, "password": password};
}
