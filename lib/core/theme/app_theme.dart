import 'package:flourish/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const _borderRaius = 10.0; // Fixed border radius

  static OutlineInputBorder _border([Color color = AppPalette.primary]) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: 3,
      ),
      borderRadius: BorderRadius.circular(_borderRaius),
    );
  }

  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPalette.background,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27.0),
      enabledBorder: _border(),
      focusedBorder:
          _border(AppPalette.secondary), // Use secondary for highlight
      errorBorder: _border(AppPalette.error),
      border: _border(),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppPalette.background,
    ),
    chipTheme: const ChipThemeData(
      side: BorderSide.none,
    ),
  );

  static final lightThemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppPalette.lightBackground, // Use lightBackground
    colorScheme: const ColorScheme(
      onSurface: AppPalette.lightBackground,
      // Light color scheme based on the palette
      primary: AppPalette.primary,
      secondary: AppPalette.secondary,
      tertiary: AppPalette.tertiary,
      background: AppPalette.lightBackground,
      surface: AppPalette.lightBackground, // Adjust for surfaces
      onBackground: AppPalette.text, // Text on background
      error: AppPalette.error,
      onPrimary: AppPalette.text, // Text on primary
      onSecondary: AppPalette.text, // Text on secondary
      onError: AppPalette.text, // Text on error
      brightness: Brightness.light,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27.0),

      focusedBorder: _border(AppPalette.primary), // Use primary for highlight
      errorBorder: _border(AppPalette.error),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppPalette.lightBackground, // Use lightBackground
    ),
    chipTheme: const ChipThemeData(
      side: BorderSide.none,
    ),
  );
}
