import 'dart:convert';

import 'package:out_of_bounds/networking/retrofit_controller.dart';
import 'package:out_of_bounds/repository/shared_preferences_repository.dart';
import 'package:rxdart/rxdart.dart';

import '../model/technology.dart';
import '../model/user.dart';

class UserRepo {
  SharedPreferencesRepository sharedPreferencesRepository;
  RetrofitController retrofitController;

  UserRepo()
      : retrofitController = RetrofitController(),
        sharedPreferencesRepository = SharedPreferencesRepository();

  Stream<User?> getUserFromLocal() => sharedPreferencesRepository.getItem(
      "user", (json) => User.fromJson(json));

  Stream<User?> updateTechnologies(List<Technology> technologies) {
    return sharedPreferencesRepository
        .getItem("user", (json) => User.fromJson(json))
        .flatMap((user) {
      if (user == null) {
        return Stream.value(user);
      }
      return retrofitController
          .authClient()
          .updateTechnologies(user.copyWith(technologies))
          .asStream()
          .flatMap((newUser) {
        return sharedPreferencesRepository.cache(newUser).map((_) => newUser);
      });
    });
  }

  Stream<User> getUserData() {
    return retrofitController.authClient().getUserData().asStream();
  }
}
