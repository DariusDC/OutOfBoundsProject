import 'package:json_annotation/json_annotation.dart';
import 'package:out_of_bounds/model/cachable_model.dart';
import 'package:out_of_bounds/model/technology.dart';
import 'mentor.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends CacheableModel {
  String? firstName;
  String? lastName;
  String? email;
  List<Technology>? technologies;
  Mentor? mentor;

  User({
    this.firstName,
    this.lastName,
    this.email,
    this.technologies,
    this.mentor,
  });

  User copyWith(List<Technology> technologies) {
    return User(
      firstName: firstName,
      lastName: lastName,
      email: email,
      technologies: technologies,
      mentor: mentor,
    );
  }

  String get fullName => "${firstName ?? ""} ${lastName ?? ""}";

  UserState get userState {
    if ((technologies?.isNotEmpty ?? false) && mentor != null) {
      return UserState.WORKING;
    }
    if ((technologies?.isNotEmpty ?? false) && mentor == null) {
      return UserState.WAITING_FOR_MENTOR;
    }
    return UserState.NO_TECHNOLOGIES;
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String get cacheKey => "user";
}

enum UserState { WAITING_FOR_MENTOR, NO_TECHNOLOGIES, WORKING }
