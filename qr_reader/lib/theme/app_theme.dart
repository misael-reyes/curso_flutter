
import 'package:flutter/material.dart';

class AppTheme {
  static const Color colorPrimary = Colors.red;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    
    primaryColor: colorPrimary,

    appBarTheme: const AppBarTheme(
      color: colorPrimary,
      elevation: 0
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: colorPrimary
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: colorPrimary,
      backgroundColor: Color.fromARGB(255, 234, 193, 193)
    )
  );
}