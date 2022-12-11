import 'package:json_annotation/json_annotation.dart';
import 'package:out_of_bounds/model/task/task_type.dart';

import 'subtask.dart';

part 'task.g.dart';

@JsonSerializable()
class Task {
  int? id;
  String? name;
  String? description;
  List<Subtask>? subTasks;
  TaskType? status;

  Task({
    required this.description,
    required this.subTasks,
    required this.name,
    required this.status,
  });

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
