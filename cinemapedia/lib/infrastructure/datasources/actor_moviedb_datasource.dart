
import 'package:cinemapedia/config/constants/enviroment.dart';
import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/mappers/actor_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';

class ActorMovieDbDatasource extends ActorsDatasource {

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
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');
    return _jsonToActors(response.data);
  }

  List<Actor> _jsonToActors( Map<String,dynamic> json ) {
    final CreditsResponse creditsDbResponse = CreditsResponse.fromJson(json);
    return creditsDbResponse.cast.map(
      (cast) => ActorMapper.castToEntity(cast)
    ).toList();
  }
  
}