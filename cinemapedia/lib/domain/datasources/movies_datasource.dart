
import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesDatasource {

  // como lucen los origenes de datos

  Future<List<Movie>> getNowPlaying({ int page = 1 });
}