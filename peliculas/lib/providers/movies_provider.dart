import 'package:flutter/cupertino.dart';

/// algunos le ponen de nombre services, pero la idea es que funcione
/// como un proveedor de informacion
/// para que esta clase sea una clase provider, tenemos que extender
/// de ChangeNotifier

class MoviesProvider extends ChangeNotifier {
  MoviesProvider() {
    print('Movies provider inicializado');
    getOnDisplayMovies();
  }

  // funicion para traernos a todas las peliculas que mostraremos
  getOnDisplayMovies() async {
    print('getOnDisplayMovies');
  }
}
