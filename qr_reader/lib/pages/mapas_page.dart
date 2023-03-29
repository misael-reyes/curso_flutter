import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/theme/app_theme.dart';

/// MapasPage retornara un Center y no un scaffol porque
/// solo necesitamos poner el center en la pagina de home
/// no necesitamos crear otro appbar o navigationbar, solo vamos
/// a colocarlo como si fuera un fragment en android

class MapasPage extends StatelessWidget {
   
  const MapasPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    //
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;
    
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: ( _ , i) => Dismissible(
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
          Provider.of<ScanListProvider>(context, listen: false).borrarScanPorId(scans[i].id!);
        },
        child: ListTile(
          leading: const Icon(Icons.map, color: AppTheme.colorPrimary),
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