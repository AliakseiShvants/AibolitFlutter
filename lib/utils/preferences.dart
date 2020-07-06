import 'package:AibolitFlutter/utils/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {

  static Future<void> writeBoolPrefs(Map<String, bool> map) async {
    var prefs = await SharedPreferences.getInstance();

    map.forEach((key, value) async {
      await prefs.setBool(key, value);
    });
  }

  static Future<void> writeBoolPref(String tag, bool flag) async {
    var prefs = await SharedPreferences.getInstance();

    await prefs.setBool(tag, flag);
  }

  static Future<List<bool>> readBoolPrefs() async {
    var prefs = await SharedPreferences.getInstance();
    var isLoggedIn = prefs.getBool(Strings.IS_LOGGED_IN) ?? false;
    var isLoginEnabled = prefs.getBool(Strings.IS_LOGIN_ENABLED) ?? false;

    return [isLoggedIn, isLoginEnabled];
  }
}