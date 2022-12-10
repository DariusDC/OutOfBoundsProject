// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse()
  ..token = json['token'] as String?
  ..type = json['type'] as String?
  ..id = json['id'] as int?
  ..username = json['username'] as String?
  ..email = json['email'] as String?
  ..roles = (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'type': instance.type,
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'roles': instance.roles,
    };
