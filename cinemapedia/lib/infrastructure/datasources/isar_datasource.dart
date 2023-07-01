
import 'package:cinemapedia/domain/datasources/local_storage_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarDatasource extends LocalStorageDatasource {

  // lo usamos con late porque la bd tiene que estar lista antes de hacer
  // cualquier acción
  late Future<Isar> db;

  // constructor
  IsarDatasource() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    
    final dir = await getApplicationDocumentsDirectory();
    
    if(Isar.instanceNames.isEmpty) { // si no tenemos ninguna instancia
      // los esquemas son las entidades que generamos
      return await Isar.open(
        [ MovieSchema ], 
        inspector: true, // nos permitirá tener un servicio para ver como esta la bd
        directory: dir.path
      );
    }
    return Future.value(Isar.getInstance());
  }
  
  @override
  Future<bool> isMovieFavorite(int movieId) async {
    final isar = await db;
    final Movie? isFavoriteMovie = await isar.movies
      .filter()
      .idEqualTo(movieId)
      .findFirst();

    return isFavoriteMovie != null;
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) async {
    // usamos await para asegurarnos que la bd ya esta lista
    final isar = await db;

    return isar.movies
      .where()
      .offset(offset)
      .limit(limit)
      .findAll();
  }

  // si esta en favoritos la quiero borrar y si no esta la quiero insertar
  @override
  Future<void> toggleFavorite(Movie movie) async {
    final isar = await db;

    final favoriteMovie = await isar.movies
      .filter()
      .idEqualTo(movie.id)
      .findFirst();

    if(favoriteMovie != null) {
      // borrar
      isar.writeTxnSync(() => isar.movies.deleteSync( favoriteMovie.isarId! ));
      return;
    }

    // inserar
    isar.writeTxnSync(() => isar.movies.putSync(movie));
  }

}