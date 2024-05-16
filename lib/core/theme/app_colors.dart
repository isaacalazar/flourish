import 'package:flutter/material.dart';

class AppPalette {
  static const Color primary = Color(0xFF29324A); // Deep Navy Blue
  static const Color secondary = Color(0xFF4D648D); // Muted Purple
  static const Color tertiary = Color(0xFF839EBC); // Light Blue
  static const Color background = Color(0xFF181818); // True Black

  // Light theme colors
  static const Color lightBackground = Color(0xFFF5F5F5); // Light Gray
  static const Color lightBorder = Color(0xFFE0E0E0); // Lighter Gray

  static const Color text =
      Color(0xFF212121); // Dark Gray (text color for light theme)
  static const Color placeholderText = Color(0xFFA0A0A0); // Mid Gray

  static const Color error = Color(0xFFF25234); // Red
  static const Color success = Color(0xFF34C759); // Green

  // Helper method for generating gradients (optional)
  static LinearGradient generateGradient(Color color1, Color color2) {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [color1, color2],
    );
  }

  // Example usage of generateGradient (optional)
  static final primaryGradient = generateGradient(primary, secondary);
}
