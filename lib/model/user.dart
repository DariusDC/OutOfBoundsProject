import 'package:json_annotation/json_annotation.dart';
import 'package:out_of_bounds/model/technology.dart';
import 'mentor.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
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

  String get fullName => "${firstName ?? ""} ${lastName ?? ""}";

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
