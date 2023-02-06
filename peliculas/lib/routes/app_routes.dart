// clase donde alojaremos todas las rutas de nuestra app

import 'package:flutter/cupertino.dart';
import 'package:peliculas/screens/screens.dart';

class AppRoutes {
  // ruta inicial
  static const initialRoute = 'home';

  // rutas
  static Map<String, Widget Function(BuildContext)> routes = {
    'home': ( _ ) => const HomeScreen(),
    'details': ( _ ) => const DetailsScreen() 
  };
}
