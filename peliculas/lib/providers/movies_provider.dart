import 'dart:convert';

import 'package:flutter/cupertino.dart';
// esto es de la libreria http
import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';

/// algunos le ponen de nombre services, pero la idea es que funcione
/// como un proveedor de informacion
/// para que esta clase sea una clase provider, tenemos que extender
/// de ChangeNotifier

class MoviesProvider extends ChangeNotifier {
  //
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = '59d52311717635a679931ce80df710d6';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  // <idMovie, ListadoActores>
  Map<int, List<Cast>> moviesCast = {};

  int _popularPage = 0;

  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();
  }

  // con los corchetes indicamos que sera opcional pero sin poner el nombre del parametro
  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    var url = Uri.https(
        _baseUrl, // dominio
        endpoint, // segmento
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    return response.body;
  }

  // funicion para traernos a todas las peliculas que mostraremos
  getOnDisplayMovies() async {
    final jsonData = await _getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
    onDisplayMovies = nowPlayingResponse.results;
    // con este metodo avisamo a los widgets que estan escuchando que hubo un cambio en la data
    notifyListeners();
  }

  // funcion para pedir las peliculas populares
  getPopularMovies() async {
    _popularPage++;
    final jsonData = await _getJsonData('3/movie/popular', _popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);
    // lo destructuramos
    popularMovies = [...popularMovies, ...popularResponse.results];

    // con este metodo avisamo a los widgets que estan escuchando que hubo un cambio en la data
    notifyListeners();
  }

  // función asincrona por que será una petición http
  Future<List<Cast>> getMovieCast(int movieId) async {
    //TODO: revisar el mapa
    print("pidiendo actores de una pelicula al servidor");

    final jsonData = await _getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditResponse.fromRawJson(jsonData);

    moviesCast[movieId] = creditsResponse.cast;

    return creditsResponse.cast;
  }
}
