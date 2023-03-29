import 'package:flutter/material.dart';
import 'package:qr_reader/models/scan_model.dart';

class MapaPage extends StatelessWidget {
   
  const MapaPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    // recibimos el argumento que nos mandaron de la vista anterior
    
    final ScanModel scan = ModalRoute.of(context)!.settings.arguments as ScanModel;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coordenadas'),
        centerTitle: true,
      ),
      body: Center(
         child: Text(scan.valor),
      ),
    );
  }
}