
import 'package:flutter/material.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:qr_reader/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
	//
	List<ScanModel> scans = [];
	String tipoSeleccionado = 'http';
	
	nuevoScan( String valor ) async {
		final nuevoScan = ScanModel(valor: valor);
		// insertamos el scan en la base de datos
		final id = await DBProvider.db.nuevoScan(nuevoScan);
		// asignar el id de la base de datos al model
		nuevoScan.id = id;
		
		// actualizamos la lista y notificamos
		if (tipoSeleccionado == nuevoScan.tipo) { 
			scans.add(nuevoScan);
			notifyListeners(); 
		}
	}
}