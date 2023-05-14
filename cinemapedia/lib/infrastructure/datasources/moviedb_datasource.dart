
import 'package:cinemapedia/config/constants/enviroment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:dio/dio.dart';

class MovieDbDatasource extends MoviesDatasource {

  // estas configuraciones son propias para este datasource
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key' : Enviroment.theMovieDbKey,
        'language': 'es-MX'
      }
    )
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    // estamos usando dio para hacer peticiones http

    final respone = await dio.get('/movie/now_playing');
    final List<Movie> movies = [];

    return movies;
  }

}