import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/theme/app_theme.dart';

class ScanTiles extends StatelessWidget {
	//
	final String tipo;
	
  const ScanTiles({super.key, required this.tipo});

  @override
  Widget build(BuildContext context) {
    //
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, i) => Dismissible(
        // UniqueKey se encarga de crear un key unico para nosotros
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (DismissDirection direction) {
          // debemos impactar la base de datos
          // para que no nos marque error, tenemos que pasar el listen en false,
          /// ya que no queremos redibujar el widget, ya que estamos fuera del
          /// arbol de widgets
          Provider.of<ScanListProvider>(context, listen: false)
              .borrarScanPorId(scans[i].id!);
        },
        child: ListTile(
          leading: Icon(
						tipo == 'http'
							? Icons.home_outlined
							: Icons.map_outlined, 
						color: AppTheme.colorPrimary
					),
          title: Text(scans[i].valor),
          subtitle: Text(scans[i].id.toString()),
          trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
          // ignore: avoid_print
          onTap: () => print(scans[i].id),
        ),
      ),
    );
  }
}