// clase donde configuraremos el tema de nuestra app

import 'package:flutter/material.dart';

class AppTheme {

  static const primaryColor = Colors.green;

  // hacemos una copia del light para modificarla
  static final ThemeData ligthTheme = ThemeData.light().copyWith(
    // color primario
    primaryColor: primaryColor,

    // AppBar theme
    appBarTheme: const AppBarTheme(
      color: primaryColor,
      elevation: 0
    )
  );
}
