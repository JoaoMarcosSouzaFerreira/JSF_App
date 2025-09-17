import 'package:flutter/material.dart';

class AppTheme {
  static const Color _jsfBlue = Color(0xFF1A3D63);
  static const Color _jsfGreen = Color(0xFF6EB4A3);
  static const Color _darkText = Color(0xFF333333);

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: _jsfBlue,
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),

    colorScheme: const ColorScheme.light(
      primary: _jsfBlue,
      secondary: _jsfGreen,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      background: Color(0xFFF5F5F5),
      surface: Colors.white,
      error: Colors.redAccent,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: _jsfBlue,
      foregroundColor: Colors.white,
      elevation: 4.0,
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: _darkText),
      bodyMedium: TextStyle(color: _darkText),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _jsfBlue,
        foregroundColor: Colors.white,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: _jsfGreen,
    scaffoldBackgroundColor: const Color(0xFF121212),

    colorScheme: const ColorScheme.dark(
      primary: _jsfGreen,
      secondary: _jsfBlue,
      onPrimary: Colors.black,
      onSecondary: Colors.white,
      background: Color(0xFF121212),
      surface: Color(0xFF1E1E1E),
      error: Colors.red,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E1E1E),
      foregroundColor: Colors.white,
      elevation: 4.0,
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color(0xFFE0E0E0)),
      bodyMedium: TextStyle(color: Color(0xFFE0E0E0)),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _jsfGreen,
        foregroundColor: Colors.black,
      ),
    ),
  );
}
