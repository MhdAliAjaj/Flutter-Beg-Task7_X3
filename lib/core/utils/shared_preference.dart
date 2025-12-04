import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPrefs? _instance;
  static SharedPreferences? _prefs;
  SharedPrefs._internal();
  factory SharedPrefs() {
    _instance ??= SharedPrefs._internal();
    return _instance!;
  }
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }
  // Auth related methods
  Future<void> saveToken(String token) async {
    await _prefs?.setString('token', token);
  }
  String? getToken() {
    final token = _prefs?.getString('token');
    return token;
  }
  Future<void> saveUserData(Map<String, dynamic> userData) async {
    await _prefs?.setString('user_data', json.encode(userData));
  }
  Map<String, dynamic>? getUserData() {
    final data = _prefs?.getString('user_data');
    if (data != null && data.isNotEmpty) {
      try {
        return json.decode(data);
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  Future<void> setOnboardingCompleted() async {
    await _prefs?.setBool('onboarding_completed', true);
  }
  bool isOnboardingCompleted() {
    return _prefs?.getBool('onboarding_completed') ?? false;
  }
  Future<void> setFirstLaunchCompleted() async {
    await _prefs?.setBool('first_launch', false);
  }
  bool isFirstLaunch() {
    return _prefs?.getBool('first_launch') ?? true;
  }
  Future<void> saveSearchHistory(List<String> searches) async {
    await _prefs?.setStringList('search_history', searches);
  }
  List<String> getSearchHistory() {
    return _prefs?.getStringList('search_history') ?? [];
  }
  Future<void> addToSearchHistory(String query) async {
    if (query.trim().isEmpty) return;
    final history = getSearchHistory();
    history.removeWhere((item) => item.toLowerCase() == query.toLowerCase());
    history.insert(0, query);
    if (history.length > 10) {
      history.removeLast();
    }
    await saveSearchHistory(history);
  }
  Future<void> clear() async {
    await _prefs?.clear();
  }
  bool isLoggedIn() {
    final token = getToken();
    return token != null && token.isNotEmpty;
  }
  int? getUserId() {
    final data = getUserData();
    return data?['id'] as int?;
  }
}