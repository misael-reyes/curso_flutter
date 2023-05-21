
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// la idea es implementar un mapa que contenga a las peliculas ya cargadas, cuando
/// el usuario seleccione una pelicula verificamos si existe en nuestro mapa, si existe
/// lo mostramos, sino hacemos la peticion, lo agregamos al mapa y lo mostramos

final movieInfoProvider = StateNotifierProvider<MovieMapNotifier, Map<String,Movie>>((ref) {
  final getMovie = ref.watch(movieRepositoryProvider).getMovieById;
  return MovieMapNotifier(getMovie: getMovie);
});

typedef GetMovieCallback = Future<Movie> Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String,Movie>> {

  final GetMovieCallback getMovie;
  
  MovieMapNotifier({
    required this.getMovie
  }): super({});

  Future<void> loadMovie( String movieId ) async {
    if( state[movieId] != null ) return; // la película ya existe en nuestro mapa
    print('realizando petición http');
    final movie = await getMovie(movieId);

    state = {...state, movieId: movie};
  }
}