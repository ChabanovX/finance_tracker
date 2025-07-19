import 'package:shared_preferences/shared_preferences.dart';

class ThemeService {
  static const String _themeKey = 'is_system_mode';

  static Future<void> saveTheme(bool isSystemMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themeKey, isSystemMode);
  }

  static Future<bool> isSystemMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_themeKey) ?? false;
  }
}
