import 'package:out_of_bounds/model/technology.dart';
import 'package:out_of_bounds/repository/user_repo.dart';
import 'package:rxdart/rxdart.dart';

import '../../model/ui_model.dart';
import '../../model/user.dart';

class HomeViewModel {
  final UserRepo userRepo;
  final Input input;
  late Output output;

  HomeViewModel({required this.input}) : userRepo = UserRepo() {
    output = Output(
      onSubmit: input.onSubmit.flatMap(
        (technologies) => userRepo
            .updateTechnologies(technologies)
            .map((event) => UIModel.success(event))
            .onErrorReturnWith((error, stackTrace) => UIModel.error(error))
            .startWith(UIModel.loading()),
      ),
    );
  }
}

class Input {
  final PublishSubject<List<Technology>> onSubmit;
  Input(
    this.onSubmit,
  );
}

class Output {
  final Stream<UIModel<User>> onSubmit;
  Output({
    required this.onSubmit,
  });
}
