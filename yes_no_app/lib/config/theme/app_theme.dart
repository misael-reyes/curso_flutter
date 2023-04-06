import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF5C11D4);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
            'Colors must bie between 0 and ${_colorThemes.length}');

  // función para retornar el tema que configuremos
  ThemeData theme() {
    return ThemeData(
        // activamos material3
        useMaterial3: true,
        colorSchemeSeed: _colorThemes[selectedColor]);
  }
}
