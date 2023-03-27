import 'package:flutter/material.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        elevation: 5,
        child: const Icon(Icons.filter_center_focus),
        onPressed: () async {
          //String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          //  '#3D8BEF',
          //  'Cancelar',
          //  false,
          //  ScanMode.QR
          //);
          const barcodeScanRes = 'https://fernando-herrera.com';
          
          /// no queremos que se reconstruya este widget (boton) cada que se haga un notifelistener,
          /// es por eso que ponmos liste: false
          final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
          
          // insertamos el la BD
          scanListProvider.nuevoScan(barcodeScanRes);
          scanListProvider.nuevoScan('geo:23,23');
        });
  }
}
