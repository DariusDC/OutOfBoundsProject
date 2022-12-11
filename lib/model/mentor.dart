class Mentor {
  String? firstName;
  String? lastName;
  String? email;
  List<String> reviews;
  String description;

  Mentor({
    this.firstName,
    this.lastName,
    this.email,
    this.reviews = const [],
    this.description = "-",
  });

  String get fullName => "${firstName ?? ""} ${lastName ?? ""}";
}
