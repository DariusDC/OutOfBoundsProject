import 'package:out_of_bounds/model/user.dart';
import 'package:out_of_bounds/repository/user_repo.dart';
import 'package:rxdart/rxdart.dart';

class NavigationViewModel {
  final Input input;
  late Output output;
  final UserRepo _userRepo;

  NavigationViewModel(this.input, {UserRepo? userRepo})
      : _userRepo = userRepo ?? UserRepo() {
    output = Output(
      input.user
          .startWith(true)
          .flatMap((value) => _userRepo.getUserFromLocal()),
    );
  }
}

class Input {
  final Subject<bool> user;

  Input(this.user);
}

class Output {
  final Stream<User?> onUser;

  Output(this.onUser);
}
