import 'package:flutter/material.dart';

class AppTheme {
  // Color Palette inspired by Amazon
  static const Color primaryOrange = Color(0xFFFF9900);
  static const Color darkBlue = Color(0xFF232F3E);
  static const Color lightGray = Color(0xFFF3F3F3);
  static const Color mediumGray = Color(0xFFDDDDDD);
  static const Color darkGray = Color(0xFF555555);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color successGreen = Color(0xFF067D62);
  static const Color errorRed = Color(0xFFB12704);
  static const Color ratingYellow = Color(0xFFFFA41C);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: primaryOrange,
      secondary: darkBlue,
      surface: white,
      background: lightGray,
      error: errorRed,
      onPrimary: white,
      onSecondary: white,
      onSurface: black,
      onBackground: black,
      onError: white,
    ),
    scaffoldBackgroundColor: lightGray,
    appBarTheme: const AppBarTheme(
      backgroundColor: darkBlue,
      foregroundColor: white,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryOrange,
        foregroundColor: white,
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: darkBlue,
        side: const BorderSide(color: mediumGray, width: 1.5),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: mediumGray),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: mediumGray),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: primaryOrange, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: errorRed),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    ),
    cardTheme: CardTheme(
      color: white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: black),
      displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: black),
      displaySmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: black),
      headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: black),
      headlineSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: black),
      titleLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: black),
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: black),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: darkGray),
      bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: darkGray),
    ),
    iconTheme: const IconThemeData(
      color: darkGray,
      size: 24,
    ),
  );
}