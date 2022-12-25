// clase donde definiremos el tema de la app

import 'package:flutter/material.dart';

class AppTheme {
  static const Color colorPrimary = Colors.orange;

  static final ThemeData ligthTheme = ThemeData.light().copyWith(
    // color primario
    primaryColor: colorPrimary,

    // app bar theme
    appBarTheme: const AppBarTheme(
      color: colorPrimary,
      elevation: 0,
    ),

    // TextButton Theme
    textButtonTheme:
        TextButtonThemeData(style: TextButton.styleFrom(primary: colorPrimary)),

    // FloatingActionButton Theme
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: colorPrimary,
      elevation: 5,
    ),

    // ElevetedButton Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        // nos recomiendan usar backgroundColor en vez de primary
        backgroundColor: colorPrimary,
        shape: const StadiumBorder(),
        elevation: 0,
      ),
    ),
  );

  // podemos hacer un dark theme
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      // color primario
      primaryColor: colorPrimary,

      // app bar theme
      appBarTheme: const AppBarTheme(
        color: colorPrimary,
        elevation: 0,
      ),
      scaffoldBackgroundColor: Colors.black

      /// si después queremos agregar más propiedades a los widgeds como
      /// botones, input, etc, lo podemos hacer aquí
      );
}
