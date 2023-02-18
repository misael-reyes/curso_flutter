import 'dart:convert';

import 'package:flutter/cupertino.dart';
// esto es de la libreria http
import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';
import 'package:peliculas/models/now_playing_response.dart';

/// algunos le ponen de nombre services, pero la idea es que funcione
/// como un proveedor de informacion
/// para que esta clase sea una clase provider, tenemos que extender
/// de ChangeNotifier

class MoviesProvider extends ChangeNotifier {
  //
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = '59d52311717635a679931ce80df710d6';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];

  MoviesProvider() {
    print('Movies provider inicializado');
    getOnDisplayMovies();
  }

  // funicion para traernos a todas las peliculas que mostraremos
  getOnDisplayMovies() async {
    var url = Uri.https(
        _baseUrl, // dominio
        '3/movie/now_playing', // segmento
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

    onDisplayMovies = nowPlayingResponse.results;

    // con este metodo avisamo a los widgets que estan escuchando que hubo un cambio en la data
    notifyListeners();
  }
}
