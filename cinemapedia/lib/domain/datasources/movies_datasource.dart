
import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesDatasource {

  // como lucen los origenes de datos

  Future<List<Movie>> getNowPlaying({ int page = 1 });

  Future<List<Movie>> getPopular({ int page = 1 });
  
  Future<List<Movie>> getUpcoming({ int page = 1 });
  
  Future<List<Movie>> getTopRated({ int page = 1 });

}