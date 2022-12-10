import 'package:out_of_bounds/model/ui_model.dart';
import 'package:out_of_bounds/repository/auth_repository.dart';
import 'package:rxdart/rxdart.dart';

class RegisterViewModel {
  final Input input;
  late Output output;
  final AuthRepository _authRepository;

  RegisterViewModel(this.input, {AuthRepository? authRepository})
      : _authRepository = authRepository ?? AuthRepository() {
    output = Output(
      input.register.flatMap(
        (value) => _authRepository.register(
            value.username, value.password, value.email),
      ),
    );
  }
}

class Input {
  final Subject<UserRegister> register;

  Input(this.register);
}

class Output {
  final Stream<UIModel<bool>> onRegister;

  Output(this.onRegister);
}

class UserRegister {
  final String username;
  final String password;
  final String email;

  UserRegister(this.username, this.email, this.password);

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "email": email,
      };
}
