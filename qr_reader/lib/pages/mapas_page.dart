import 'package:flutter/material.dart';
import 'package:qr_reader/widgets/widgets.dart';

/// MapasPage retornara un Center y no un scaffol porque
/// solo necesitamos poner el center en la pagina de home
/// no necesitamos crear otro appbar o navigationbar, solo vamos
/// a colocarlo como si fuera un fragment en android

class MapasPage extends StatelessWidget {
   
  const MapasPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const ScanTiles(tipo: 'geo');
  }
}