import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent
];

class AppTheme {
  
  final int selectedColor;
  final bool isDarkMode;

  /// con el asserts nos aseguramos que ningun otro programador seleccione un color
  /// que no este dentro de los establecidos
  AppTheme({this.selectedColor = 0, this.isDarkMode = false})
      : assert(selectedColor >= 0, 'Selected color must be greater then 0'),
        assert(selectedColor < colorList.length, 'Selected color must be less or equal than ${colorList.length - 1}');

  ThemeData getTheme() =>
      ThemeData(
        useMaterial3: true, 
        // así ponemos el modo oscuro
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        colorSchemeSeed: colorList[selectedColor],
        appBarTheme: const AppBarTheme(
          centerTitle: true
        )
      );

  // crear una copia del tema actual
  AppTheme copyWith({
    int? selectedColorCopy,
    bool? isDarkmodeCopy
  }) => AppTheme(
    selectedColor: selectedColorCopy ?? selectedColor,
    isDarkMode: isDarkmodeCopy ?? isDarkMode
  );
}
