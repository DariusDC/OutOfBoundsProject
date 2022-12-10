import 'package:json_annotation/json_annotation.dart';

part 'subtask.g.dart';

@JsonSerializable()
class Subtask {
  final String description;
  final bool done;

  Subtask({
    required this.description,
    required this.done,
  });

  factory Subtask.fromJson(Map<String, dynamic> json) =>
      _$SubtaskFromJson(json);

  Map<String, dynamic> toJson() => _$SubtaskToJson(this);
}
