

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// este es solo un observador de MoviesNotifier
final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {

  // obtenemos solo la referencia de getNowPlaying, no la implementación
  final fetchMoreMovies = ref.watch( movieRepositoryProvider ).getNowPlaying;

  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
  );
});

final popularMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {

  final fetchMoreMovies = ref.watch( movieRepositoryProvider ).getPopular;

  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
  );
}); 







typedef MovieCallBack = Future<List<Movie>> Function({ int page });

// clase que controla o que notificará es MoviesNotifier y la data que controla o state es List<Movie>
class MoviesNotifier extends StateNotifier<List<Movie>> {

  int currentPage = 0;
  MovieCallBack fetchMoreMovies;
  // bandera para evitar cargar más de una vez las películas
  bool isLoading = false;

  // establecemos el estado inicial
  MoviesNotifier({
    required this.fetchMoreMovies
  }) : super([]);

  Future<void> loadNextPage() async {

    if( isLoading ) return;

    isLoading = true;
    currentPage ++;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
    // le damos tiempo para renderisar las peliculas antes de que vuelva hacer la petición
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}