import 'package:shared_preferences/shared_preferences.dart';

class LanguageService {
  static const String _key = 'language_code';
  static const String _defaultCode = 'en';

  static Future<String> get() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key) ?? _defaultCode;
  }

  static Future<void> set(String code) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, code);
  }
}
