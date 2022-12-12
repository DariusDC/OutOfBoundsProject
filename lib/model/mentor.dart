import 'package:json_annotation/json_annotation.dart';
part 'mentor.g.dart';

@JsonSerializable()
class Mentor {
  String? firstName;
  String? lastName;
  String? email;
  List<String> reviews;
  String description;

  Mentor({
    this.firstName,
    this.lastName,
    this.email,
    this.reviews = const [review],
    this.description = "-",
  });

  static const String review =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

  String get fullName => "${firstName ?? ""} ${lastName ?? ""}";
  factory Mentor.fromJson(Map<String, dynamic> json) {
    var js = _$MentorFromJson(json);
    js.reviews = [review];
    return js;
  }

  Map<String, dynamic> toJson() => _$MentorToJson(this);
}
