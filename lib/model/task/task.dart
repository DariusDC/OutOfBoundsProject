import 'package:json_annotation/json_annotation.dart';
import 'package:out_of_bounds/model/task/task_type.dart';

import 'subtask.dart';

part 'task.g.dart';

@JsonSerializable()
class Task {
  final String name;
  final String description;
  final List<Subtask> subtasks;
  final TaskType taskType;

  Task({
    required this.description,
    required this.subtasks,
    required this.name,
    required this.taskType,
  });

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
