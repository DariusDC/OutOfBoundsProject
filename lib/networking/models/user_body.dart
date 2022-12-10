import 'package:json_annotation/json_annotation.dart';

part 'user_body.g.dart';

@JsonSerializable()
class UserBody {
  String? email;
  String? password;
  String? username;

  UserBody({this.email, this.password, this.username});

  factory UserBody.fromJson(Map<String, dynamic> map) =>
      _$UserBodyFromJson(map);

  Map<String, dynamic> toJson() => _$UserBodyToJson(this);
}
