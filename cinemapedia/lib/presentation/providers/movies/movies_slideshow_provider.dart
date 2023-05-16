
// provider unicamente de lectura, la idea es crear este provider para solucionar
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// el problema de querer pasar solo 6 peliculas al slider cuando cargan

// ref es la referencia de todos nuestro providers, es todo el arbol que crea flutter
// es la referencia de todo el scopeprovider
final moviesSlideshowProvider = Provider<List<Movie>>((ref) {

  final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

  if(nowPlayingMovies.isEmpty) return [];

  return nowPlayingMovies.sublist(0,6);
});