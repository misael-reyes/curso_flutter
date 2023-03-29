
// utilidades del proyecto

import 'package:flutter/material.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchURL(  BuildContext context, ScanModel scanModel ) async {
	
	final Uri url = Uri.parse(scanModel.valor);
  
	if(scanModel.tipo == 'http') {
		if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
	} else {
		// navegamos a la vista del mapa
		Navigator.pushNamed(context, 'mapa', arguments: scanModel);
	}
	
	
}
