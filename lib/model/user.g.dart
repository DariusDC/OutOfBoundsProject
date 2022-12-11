// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      technologies: (json['technologies'] as List<dynamic>?)
          ?.map((e) => Technology.fromJson(e as Map<String, dynamic>))
          .toList(),
      mentor: json['mentor'] == null
          ? null
          : Mentor.fromJson(json['mentor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'technologies': instance.technologies,
      'mentor': instance.mentor,
    };
