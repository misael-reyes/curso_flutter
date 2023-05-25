
import 'package:cinemapedia/config/constants/enviroment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_details.dart';
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
  
  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    
    final response = await dio.get(
      '/movie/top_rated',
      queryParameters: {
        'page': page
      }
    );

    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    
    final response = await dio.get(
      '/movie/upcoming',
      queryParameters: {
        'page': page
      }
    );

    return _jsonToMovies(response.data);
  } 

  @override
  Future<Movie> getMovieById( String movieId ) async {
    final response = await dio.get( '/movie/$movieId' );
    if(response.statusCode != 200) throw Exception('Movie with id $movieId not found');

    final MovieDetails movieDb = MovieDetails.fromJson(response.data);

    return MovieMapper.movieDetailsToEntity(movieDb);
  }
  
  @override
  Future<List<Movie>> searchMovies(String query) async {
    final response = await dio.get(
      '/search/movie',
      queryParameters: {
        'query': query
      }
    );

    return _jsonToMovies(response.data);
  }

}