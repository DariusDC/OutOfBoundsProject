// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      description: json['description'] as String?,
      subTasks: (json['subTasks'] as List<dynamic>?)
          ?.map((e) => Subtask.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      status: $enumDecodeNullable(_$TaskTypeEnumMap, json['status']),
    )..id = json['id'] as int?;

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'subTasks': instance.subTasks,
      'status': _$TaskTypeEnumMap[instance.status],
    };

const _$TaskTypeEnumMap = {
  TaskType.DONE: 'DONE',
  TaskType.TODO: 'TODO',
  TaskType.IN_PROGRESS: 'IN_PROGRESS',
};
