import 'package:shared_preferences/shared_preferences.dart';

class HapticsService {
  static const String _hapticsKey = 'haptics_enabled';
  static const bool _defaultEnabled = true;

  static Future<void> saveEnabled(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_hapticsKey, enabled);
  }

  static Future<bool> isEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_hapticsKey) ?? _defaultEnabled;
  }
}
