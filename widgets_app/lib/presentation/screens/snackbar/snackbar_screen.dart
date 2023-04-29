import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y diálogos'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context)
      ),
    );
  }
  
  void showCustomSnackbar(BuildContext context) {
    
    // ocultamos el snackbar anterior por si hay alguno
    ScaffoldMessenger.of(context).clearSnackBars();
    
    final snackbar = SnackBar(
      content: const Text('Hola mundo'),
      // cualquier accion se cerrará el snackbar
      action: SnackBarAction(label: 'Ok', onPressed: (){}),
      duration: const Duration(seconds: 2),
    );
    
    // mostramos el snakbar
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
