import 'package:flutter/material.dart';
import 'package:qr_reader/theme/app_theme.dart';

/// MapasPage retornara un Center y no un scaffol porque
/// solo necesitamos poner el center en la pagina de home
/// no necesitamos crear otro appbar o navigationbar, solo vamos
/// a colocarlo como si fuera un fragment en android

class MapasPage extends StatelessWidget {
   
  const MapasPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: ( _ , i) => ListTile(
        leading: const Icon(Icons.map, color: AppTheme.colorPrimary),
        title: const Text('http://misadev.com'),
        subtitle: const Text('ID: 11'),
        trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
        // ignore: avoid_print
        onTap: () => print('se abre algo'),
      ),
    );
  }
}