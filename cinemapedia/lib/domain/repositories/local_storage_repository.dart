
import 'package:cinemapedia/domain/entities/movie.dart';

/// recordemos que el objetivo del repositorio es que podemos
/// estar cambiando el datasource facilmente

abstract class LocalStorageRepository {
  
  Future<void> toggleFavorite( Movie movie );

  Future<bool> isMovieFavorite( int movieId );

  Future<List<Movie>> loadMovies({ int limit = 10, offset = 0 });

}