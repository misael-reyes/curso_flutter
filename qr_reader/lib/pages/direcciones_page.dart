import 'package:flutter/material.dart';
import 'package:qr_reader/widgets/widgets.dart';

class DireccionesPage extends StatelessWidget {
   
  const DireccionesPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const ScanTiles(tipo: 'http');
  }
}