import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _mode = _getInitialThemeMode();

  static ThemeMode _getInitialThemeMode() => ThemeMode.dark;

  void changeTheme() {
    if (_mode == ThemeMode.dark) {
      _mode = ThemeMode.light;
    } else {
      _mode = ThemeMode.dark;
    }
    notifyListeners();
  }

  ThemeMode get getTheme => _mode;
}
