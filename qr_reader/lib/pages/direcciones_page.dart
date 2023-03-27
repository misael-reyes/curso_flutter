import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/theme/app_theme.dart';

class DireccionesPage extends StatelessWidget {
   
  const DireccionesPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    //
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;
    
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, i) => ListTile(
        leading: const Icon(Icons.home_outlined, color: AppTheme.colorPrimary),
        title: Text(scans[i].valor),
        subtitle: Text(scans[i].id.toString()),
        trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
        // ignore: avoid_print
        onTap: () => print(scans[i].id),
      ),
    );
  }
}