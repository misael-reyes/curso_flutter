
import 'package:cinemapedia/domain/entities/movie.dart';

// los repositorios son los que llaman a los datasources

abstract class MoviesRepository {

  Future<List<Movie>> getNowPlaying({ int page = 1 });

  Future<List<Movie>> getPopular({ int page = 1 });
  
  Future<List<Movie>> getUpcoming({ int page = 1 });
  
  Future<List<Movie>> getTopRated({ int page = 1 });

  Future<Movie> getMovieById( String movieId );

  Future<List<Movie>> searchMovies( String query );

}