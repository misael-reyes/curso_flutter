import 'package:flutter/material.dart' show IconData, Widget;

/// esta clase nos servirá como un modelo para nuestros item
/// que tenemos en nuestro listview, es similar a lo que hacemos
/// en android.

class MenuOption {
  final String route;
  final IconData icon;
  final String name;
  // esta es la pantalla que se mostrará
  final Widget screen;

  // constructor

  /// lo ponemos entre llaves para obligar al programador que use nuestro
  /// modelo aque ponga nombre a sus parametros
  MenuOption({
    required this.route,
    required this.icon,
    required this.name,
    required this.screen,
  });
}
