import 'package:flutter/material.dart';

class ThemeModel extends ChangeNotifier {
  ThemeMode _mode = ThemeMode.light;

  ThemeMode get mode => _mode;

  bool get isDark => _mode == ThemeMode.dark;

  void setDark(bool value) {
    _mode = value ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
