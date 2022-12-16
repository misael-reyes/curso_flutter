/// para no tener todas las importaciones aqui, es mejor tener
/// una sola importacion para todas nuestras vistas, eso lo podemos
/// hacer gracias al archivo barril, en ingles barrel file que lo
/// crearemos dentro de nuestra carpeta donde estan las vistas, ojo,
/// el archivo tiene que tener el mismo nombre que la carpeta

import 'package:fl_components/router/app_routes.dart';
import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

// hemos traido todas nuestras importaciones de las vistas en una sola
import 'package:fl_components/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        //home: const AlertScreen(),

        // initialRoute: 'home', lo comentamos para usar la clase AppRouter
        initialRoute: AppRoutes.initialRoute,
        // empezaremos a trabajar con rutas
        // routes ya contiene todas las rutas en forma de map
        // routes: AppRoutes.routes,
        routes: AppRoutes.getAppRoutes(), // nueva forma de rutas
        // rutas creadas de manera dinamica
        onGenerateRoute: AppRoutes.onGenerateRoute,
        // thema de la app
        theme: AppTheme.ligthTheme);
  }
}
