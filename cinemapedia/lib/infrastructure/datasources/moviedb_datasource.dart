
import 'package:cinemapedia/config/constants/enviroment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb_response.dart';
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

    final response = await dio.get(
      '/movie/now_playing',
      queryParameters: {
        'page': page
      }
    );

    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    
    final response = await dio.get(
      '/movie/popular',
      queryParameters: {
        'page': page
      }
    );

    return _jsonToMovies(response.data);
  }

  List<Movie> _jsonToMovies( Map<String, dynamic> json ) {
    final movieDbResponse = MovieDbResponse.fromJson(json);
    final List<Movie> movies = movieDbResponse.results
    /// validamos si la pelicula tiene un poster o no, si no tine
    /// poste, simplemente lo ignora y no lo coloca en la lista
    .where((movieDb) => movieDb.posterPath != 'no-poster')
    .map(
      (movieDb) => MovieMapper.movieDBToEntity(movieDb)
    ).toList();
    return movies;
  } 

}