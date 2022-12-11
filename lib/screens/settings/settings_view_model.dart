import 'package:out_of_bounds/repository/auth_repository.dart';
import 'package:rxdart/rxdart.dart';

class SettingsViewModel {
  final Input input;
  late Output output;
  final AuthRepository _authRepository;

  SettingsViewModel(this.input, {AuthRepository? authRepository})
      : _authRepository = authRepository ?? AuthRepository() {
    output = Output(
      input.settingAction.flatMap((option) {
        switch (option) {
          case SettingsListOption.LOGOUT:
            return _authRepository.logout().map(
                  (event) => option,
                );
        }
      }).asBroadcastStream(),
    );
  }
}

class Input {
  final Subject<SettingsListOption> settingAction;

  Input(this.settingAction);
}

class Output {
  final Stream<SettingsListOption> onSettingAction;

  Output(this.onSettingAction);
}

enum SettingsListOption { LOGOUT }
