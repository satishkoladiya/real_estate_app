import 'package:flutter/material.dart';

class AppTheme {
  static const brown = Color(0xFFA5957E);
  static const darken = Color(0xFF232220);
  static const darkLess = Color(0xFF2B2B2B);
  static const lighten = Color(0xFFFBF5EB);
  static const gold = Color(0xFFFC9E12);
  static const kPrimaryColor = Color(0xFFFC9D11);
  static const kSecondary = Color(0xFF232220);
  static const cardBackground = Color(0xFFFCF6EF);
  static String get _fontFamily => 'Euclid';

  static ColorScheme get _lightScheme {
    return ColorScheme.fromSeed(
      seedColor: brown,
      brightness: Brightness.light,
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: _fontFamily,
      colorScheme: _lightScheme,
      platform: TargetPlatform.iOS,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        iconSize: 18,
        sizeConstraints: BoxConstraints(
          minHeight: 48,
          minWidth: 48,
        ),
      ),
    );
  }
}
