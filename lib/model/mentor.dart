class Mentor {
  String? firstName;
  String? lastName;
  String? email;

  Mentor({
    this.firstName,
    this.lastName,
    this.email,
  });

  String get fullName => "${firstName ?? ""} ${lastName ?? ""}";
}
