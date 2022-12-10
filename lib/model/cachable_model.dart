abstract class CacheableModel {
  String get cacheKey;

  Map<String, dynamic> toJson();
}
