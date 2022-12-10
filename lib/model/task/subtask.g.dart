// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subtask.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subtask _$SubtaskFromJson(Map<String, dynamic> json) => Subtask(
      description: json['description'] as String,
      done: json['done'] as bool,
    );

Map<String, dynamic> _$SubtaskToJson(Subtask instance) => <String, dynamic>{
      'description': instance.description,
      'done': instance.done,
    };
