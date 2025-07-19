
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TintColorService {
  static const String _colorKey = 'tint_color';
  static const int _defaultTint = 0xFF2AE881;

  static Future<int> get() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_colorKey) ?? _defaultTint;
  }

  static Future<void> store(Color color) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(_colorKey, color.value);
  }
}
