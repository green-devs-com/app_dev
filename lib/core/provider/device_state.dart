import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 테마 변경 관리
// -------------------------------------------------------------------------- //
// -------------------------------------------------------------------------- //
final themeState = StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.system) {
    getThemeMode();
  }

  final SharedPreferencesAsync _prefs = SharedPreferencesAsync();

  void getThemeMode() async {
    final theme = await _prefs.getString('theme');

    if (theme == "light") {
      state = ThemeMode.light;
    } else if (theme == "dark") {
      state = ThemeMode.dark;
    } else {
      state = ThemeMode.system;
    }
  }

  void setThemeMode({required ThemeMode themeMode}) async {
    if (themeMode == ThemeMode.light) {
      await _prefs.setString('theme', 'light');
      state = ThemeMode.light;
    } else if (themeMode == ThemeMode.dark) {
      await _prefs.setString('theme', 'dark');
      state = ThemeMode.dark;
    } else {
      await _prefs.setString('theme', 'system');
      state = ThemeMode.system;
    }
  }
}
