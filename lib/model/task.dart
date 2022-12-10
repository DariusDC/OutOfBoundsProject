import 'subtask.dart';

class Task {
  final String name;
  final String description;
  final List<Subtask> subtasks;

  Task({
    required this.description,
    required this.subtasks,
    required this.name,
  });
}
