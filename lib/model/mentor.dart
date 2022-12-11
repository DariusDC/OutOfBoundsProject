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
    this.reviews = const [],
    this.description = "-",
  });

  String get fullName => "${firstName ?? ""} ${lastName ?? ""}";
  factory Mentor.fromJson(Map<String, dynamic> json) => _$MentorFromJson(json);

  Map<String, dynamic> toJson() => _$MentorToJson(this);
}
