import 'package:out_of_bounds/networking/retrofit_controller.dart';

import '../model/technology.dart';
import '../model/user.dart';

class UserRepo {
  RetrofitController retrofitController;
  UserRepo() : retrofitController = RetrofitController();

  Stream<User> updateTechnologies(List<Technology> technologies) {
    return Stream.value(User());
  }

  Stream<User> getUserData() {
    return retrofitController.authClient().getUserData().asStream();
  }
}
