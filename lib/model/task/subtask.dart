import 'package:json_annotation/json_annotation.dart';

part 'subtask.g.dart';

@JsonSerializable()
class Subtask {
  int? id;
  String? name;
  String? description;
  bool? done;

  Subtask({
    required this.id,
    required this.name,
    required this.description,
    required this.done,
  });

  factory Subtask.fromJson(Map<String, dynamic> json) =>
      _$SubtaskFromJson(json);

  Map<String, dynamic> toJson() => _$SubtaskToJson(this);
}
