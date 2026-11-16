import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const _seedColor = Color(0xFF2E7D32);

  static ThemeData get light => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: _seedColor),
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide.none,
      ),
    ),
    cardTheme: const CardThemeData(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
    ),
  );

  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: Brightness.dark,
    ),
    brightness: Brightness.dark,
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide.none,
      ),
    ),
    cardTheme: const CardThemeData(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
    ),
  );
}
