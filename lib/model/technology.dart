import 'package:json_annotation/json_annotation.dart';
part 'technology.g.dart';

@JsonSerializable()
class Technology {
  final String name;
  final TechnologyType type;

  Technology({
    required this.name,
    this.type = TechnologyType.any,
  });

  factory Technology.fromJson(Map<String, dynamic> json) =>
      _$TechnologyFromJson(json);

  String get description {
    switch (type) {
      case TechnologyType.fullStack:
        return "Full Stack";
      case TechnologyType.frontEnd:
        return "Front End";
      case TechnologyType.backEnd:
        return "Back End";
      case TechnologyType.mobile:
        return "Mobile";
      case TechnologyType.ai:
        return "AI";
      case TechnologyType.imageProcessing:
        return "Image Processing";
      case TechnologyType.any:
        return "Any";
    }
  }

  Map<String, dynamic> toJson() => _$TechnologyToJson(this);
}

enum TechnologyType {
  fullStack,
  frontEnd,
  backEnd,
  mobile,
  ai,
  imageProcessing,
  any,
}

extension TechnologyTypeExtension on TechnologyType {
  String get textValue {
    switch (this) {
      case TechnologyType.fullStack:
        return "Full Stack";
      case TechnologyType.frontEnd:
        return "Front End";
      case TechnologyType.backEnd:
        return "Back End";
      case TechnologyType.mobile:
        return "Mobile";
      case TechnologyType.ai:
        return "AI";
      case TechnologyType.imageProcessing:
        return "Image Processing";
      case TechnologyType.any:
        return "Any";
    }
  }
}
