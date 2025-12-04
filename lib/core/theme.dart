import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryGreen = Color(0xFF34C759);
  static const Color bgGrey = Color(0xFFF7F7F9);

  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: bgGrey,
    fontFamily: "Raleway",
    primaryColor: primaryGreen,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
}
