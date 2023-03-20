import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/pages/pages.dart';
import 'package:qr_reader/providers/ui_provider.dart';
import 'package:qr_reader/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    // ponemos aqui el multiprovider porque lo queremos hasta arriba de nuestro arbol de widgets
    return MultiProvider(

      providers: [
        // esto es parecido a singelton
        ChangeNotifierProvider(create: ( _ ) => UiProvider())
      ],

      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        routes: {
          'home' : ( _ ) => const HomePage(),
          'mapa' : ( _ ) => const MapaPage()
        },
        theme: AppTheme.lightTheme
      ),
    );

  }
}