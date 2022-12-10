import 'dart:convert';

import 'package:out_of_bounds/model/cachable_model.dart';
import 'package:out_of_bounds/model/session.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepository {
  Stream<SharedPreferences> _initSharedPreferences() {
    return SharedPreferences.getInstance().asStream();
  }

  Stream<String?> getString(String key) => _initSharedPreferences().map(
        (_sharedPrefs) => _sharedPrefs.getString(key),
      );

  Stream<int?> getInt(String key) => _initSharedPreferences().map(
        (_sharedPrefs) => _sharedPrefs.getInt(key),
      );

  Stream<T?> getItem<T>(String key, T Function(dynamic json) f) =>
      getString(key).map((item) {
        if (item == null) return null;
        return f(jsonDecode(item));
      });

  Stream<bool> setString(String key, String value) {
    return _initSharedPreferences().flatMap((_sharedPreferences) =>
        _sharedPreferences.setString(key, value).asStream());
  }

  Stream<bool> setInt(String key, int value) =>
      _initSharedPreferences().flatMap((_sharedPreferences) =>
          _sharedPreferences.setInt(key, value).asStream());

  Stream<bool> remove(String key) => _initSharedPreferences().flatMap(
        (_sharedPrefs) => Stream.fromFuture(_sharedPrefs.remove(key)),
      );

  Stream<bool> cache<T extends CacheableModel>(T data) {
    if (data.cacheKey.isEmpty) {
      return Stream.error(CacheError.emptyKey());
    }

    String value = json.encode(data.toJson());
    return setString(data.cacheKey, value);
  }

  Stream<Session?> getCurrentSession() => getItem(
        "session",
        (json) => Session.fromJson(json),
      ).map((session) {
        if (session == null) return null;
        return Session(authToken: session.authToken);
      });
}

class CacheError extends Error {
  final String message;

  CacheError(this.message);

  factory CacheError.emptyKey() => CacheError("Cache key is empty");
}
