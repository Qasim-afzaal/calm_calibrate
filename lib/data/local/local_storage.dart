import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// Thin wrapper around SharedPreferences — swap for backend API later.
class LocalStorage {
  LocalStorage._();
  static LocalStorage? _instance;
  static SharedPreferences? _prefs;

  static Future<LocalStorage> init() async {
    _prefs = await SharedPreferences.getInstance();
    _instance ??= LocalStorage._();
    return _instance!;
  }

  static LocalStorage get instance {
    final i = _instance;
    final p = _prefs;
    if (i == null || p == null) {
      throw StateError('LocalStorage not initialized. Call init() first.');
    }
    return i;
  }

  String? getString(String key) => _prefs!.getString(key);

  Future<void> setString(String key, String value) async {
    await _prefs!.setString(key, value);
  }

  Future<void> remove(String key) async {
    await _prefs!.remove(key);
  }

  Map<String, dynamic>? getJson(String key) {
    final raw = getString(key);
    if (raw == null) return null;
    return jsonDecode(raw) as Map<String, dynamic>;
  }

  Future<void> setJson(String key, Map<String, dynamic> value) async {
    await setString(key, jsonEncode(value));
  }

  Future<void> clearAll() async {
    await _prefs!.clear();
  }
}

abstract final class CacheKeys {
  static const appState = 'app_state_v1';
}
