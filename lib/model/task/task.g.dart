// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      description: json['description'] as String,
      subtasks: (json['subtasks'] as List<dynamic>)
          .map((e) => Subtask.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
      taskType: $enumDecode(_$TaskTypeEnumMap, json['taskType']),
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'subtasks': instance.subtasks,
      'taskType': _$TaskTypeEnumMap[instance.taskType]!,
    };

const _$TaskTypeEnumMap = {
  TaskType.DONE: 'DONE',
  TaskType.TODO: 'TODO',
  TaskType.IN_PROGRESS: 'IN_PROGRESS',
};
