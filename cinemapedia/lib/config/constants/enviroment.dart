
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// La idea de esta clase es colocar en variables estaticas todas las 
/// variables de entorno que se encuentran en el archivo .env, así es más
/// fácil acceder desde cualquier parte de la app

class Enviroment {
  static String theMovieDbKey = dotenv.env['THE_MOVIEDB_KEY'] ?? 'No hay API KEY';
}