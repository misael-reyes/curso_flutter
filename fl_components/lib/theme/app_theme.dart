// clase donde definiremos el tema de la app

import 'package:flutter/material.dart';

class AppTheme {
  static const Color colorPrimary = Colors.red;

  static final ThemeData ligthTheme = ThemeData.light().copyWith(
    // color primario
    primaryColor: colorPrimary,

    // app bar theme
    appBarTheme: const AppBarTheme(
      color: colorPrimary,
      elevation: 0,
    ),

    /// si después queremos agregar más propiedades a los widgeds como
    /// botones, input, etc, lo podemos hacer aquí
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
