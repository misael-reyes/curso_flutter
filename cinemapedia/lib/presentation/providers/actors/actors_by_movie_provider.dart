
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsByMovieProvider = StateNotifierProvider<ActorsByMovieNotifier, Map<String,List<Actor>>>((ref) {
  final actorsRepository = ref.watch( actorsRepositoryProvider );
  return ActorsByMovieNotifier(getActors: actorsRepository.getActorsByMovie);
});

/// igual que con el mapa que apuntaba a una pelicula, en esa ocación
/// vamos a tener de estado otro mapa pero el id de la pelicula va a 
/// apuntar a una lista de actores

typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String,List<Actor>>> {

  final GetActorsCallback getActors;
  
  ActorsByMovieNotifier({
    required this.getActors
  }): super({});

  Future<void> loadActors( String movieId ) async {
    if( state[movieId] != null ) return; // la película ya existe en nuestro mapa
    
    final List<Actor> actors = await getActors(movieId);

    state = {...state, movieId: actors};
  }
}