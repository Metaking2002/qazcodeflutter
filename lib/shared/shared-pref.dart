
import 'package:shared_preferences/shared_preferences.dart';


class SharedPreferencesHelper {
  ///
  /// Instantiation of the SharedPreferences library
  ///
  static final String bollornot = 'sign';
  static Future<String> getLanguageCode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('d') ?? 'n';
  }
  static Future<bool> setLanguageCode(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool('d', value);
  }
  static Future<bool> setSign(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(bollornot, value);
    return prefs.setString(bollornot, value);
  }
}