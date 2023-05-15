
import 'package:cinemapedia/domain/entities/movie.dart';

// los repositorios son los que llaman a los datasources

abstract class MoviesRepository {

  Future<List<Movie>> getNowPlaying({ int page = 1 });
}