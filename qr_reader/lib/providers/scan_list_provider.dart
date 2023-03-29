
import 'package:flutter/material.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:qr_reader/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
	//
	List<ScanModel> scans = [];
	String tipoSeleccionado = 'http';
	
	Future<ScanModel> nuevoScan( String valor ) async {
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
		
		return nuevoScan;
	}
	
	cargarScans( ) async {
		final scans = await DBProvider.db.getAllScans();
		/// En resumen, la línea de código this.scans = [...scans]; 
		/// está creando una nueva lista llamada scans y copiando todos 
		/// los elementos de la lista original scans en ella utilizando 
		/// el "spread operator".
		this.scans = [...scans];
		// actualizamos la pantalla
		notifyListeners();
	}
	
	cargarScansPorTipo( String tipo ) async {
		final scans = await DBProvider.db.getScanByType(tipo);
		this.scans = [...scans];
		tipoSeleccionado = tipo;
		notifyListeners();
	}
	
	borrarTodos() async {
		await DBProvider.db.deleteAllScans();
		scans = [];
		notifyListeners();
	}
	
	borrarScanPorId( int id ) async {
		await DBProvider.db.deleteScan(id);
		// cargarScansPorTipo ya ejecuta el notifyListeners
		// cargarScansPorTipo(tipoSeleccionado);
	}
}