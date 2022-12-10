import 'package:out_of_bounds/model/cachable_model.dart';

class Session extends CacheableModel {
  final String? authToken;

  Session({required this.authToken});

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      authToken: json["token"],
    );
  }

  @override
  String get cacheKey => "session";

  @override
  Map<String, dynamic> toJson() {
    return {
      "token": authToken,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Session &&
          runtimeType == other.runtimeType &&
          authToken == other.authToken;

  @override
  int get hashCode => authToken.hashCode;
}
