
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/local_storage_repository.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// la idea es tener en un mapa todas las peliculas que esten en la seccion de
/// favoritos para que sea más facil el axceso a ellas, es por ello que creamos un
/// provider para tener el estado de esas peliculas, y el estado va hacer de tipo
/// Map<int,Movie>
/// 
/// https://docs-v2.riverpod.dev/docs/providers/state_notifier_provider

final favoriteMoviesProvider = StateNotifierProvider<StorageMoviesNotifier, Map<int, Movie>>((ref) {
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);
  return StorageMoviesNotifier(localStorageRepository: localStorageRepository);
});

class StorageMoviesNotifier extends StateNotifier<Map<int, Movie>> {

  // necesitamos conocer cual es la pagina
  int page = 0;
  final LocalStorageRepository localStorageRepository;
  
  /// recordar que en el constructor debemos de inicializar el estado con super, en este caso
  /// estamos iniciando el estado con un mapa vacio
  StorageMoviesNotifier({
    required this.localStorageRepository
  }) : super({});

  Future<List<Movie>> loadNextPage() async {
    final movies = await localStorageRepository.loadMovies(offset: page * 10, limit: 20);
    page ++;

    // tenemos que actualizar nuestro state
    final tempMoviesMap = <int, Movie>{};

    for(final movie in movies) {
      tempMoviesMap[movie.id] = movie;
    }

    /// actualizamos el mapa state al combinar sus elementos existentes con los elementos
    /// de tempMoviesMap
    state = { ...state, ...tempMoviesMap };

    return movies;
  }

  Future<void> toggleFavorite( Movie movie ) async {
    // impactamos en la base de datos, al usar un repository, no me importa quien es el proveedor de la BD
    await localStorageRepository.toggleFavorite(movie);
    // revisamos si la pelicula se encuentra en la lista de favoritos
    final bool isMovieInFavorites = state[movie.id] != null;

    if (isMovieInFavorites) {
      // lo quitamos del estado
      state.remove(movie.id);
      // pero no se renderiza la vista, ya que tenemos que hacer state = para renderizar
      state = { ...state };
    } else {
      // aqui lo dejamos como esta pero añadimos la nueva película al mapa
      state = { ...state, movie.id: movie };
    }
  }
}