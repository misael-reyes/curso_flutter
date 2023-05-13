import 'package:flutter/material.dart';

import 'package:cinemapedia/config/router/app_router.dart';
// esta es de la libreria flutter_dotenv para usar el .env
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:cinemapedia/config/theme/app_theme.dart';

Future<void> main() async {

  /// esto es lo que se tiene que hacer para usar el .env
  /// con eso, tendremos acceso a las variables de entorno en toda
  /// nuestra app
  /// https://pub.dev/packages/flutter_dotenv
  await dotenv.load(fileName: '.env');

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // para usar gorouter, tenmos que poner MaterialApp.router
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      // lo de abajo se quita porque las vistas ya estan en la variable appRouter
      // home: const Scaffold(
      //   body: Center(
      //     child: Text('Hello World!'),
      //   ),
      // ),
    );
  }
}
