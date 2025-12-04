import 'package:shared_preferences/shared_preferences.dart';

class PrefService {
  static Future<void> saveToken(String token) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString("accessToken", token);
  }

  static Future<String?> getToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString("accessToken");
  }

  static Future<void> clearToken() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove("accessToken");
  }

  static Future<void> setOnboardingSeen(bool seen) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool("onboarding_seen", seen);
  }

  static Future<bool> isOnboardingSeen() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool("onboarding_seen") ?? false;
  }
}
