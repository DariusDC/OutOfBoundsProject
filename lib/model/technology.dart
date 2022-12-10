class Technology {
  final String name;
  final String description;
  final TechnologyType type;

  Technology({
    required this.name,
    required this.description,
    this.type = TechnologyType.any,
  });
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
