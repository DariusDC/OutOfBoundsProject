import 'package:out_of_bounds/model/ui_model.dart';
import 'package:out_of_bounds/model/user_response.dart';
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
        (value) => _authRepository.register(value),
      ),
    );
  }
}

class Input {
  final Subject<UserRegister> register;

  Input(this.register);
}

class Output {
  final Stream<UIModel<UserResponse>> onRegister;

  Output(this.onRegister);
}

class UserRegister {
  final String email;
  final String password;
  final String firstName;
  final String lastName;

  UserRegister(this.email, this.password, this.firstName, this.lastName);

  Map<String, dynamic> toJson() => {
        "password": password,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
      };
}
