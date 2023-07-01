
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
  Future<bool> isMovieFavorite(int movieId) {
    // TODO: implement isMovieFavorite
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) {
    // TODO: implement loadMovies
    throw UnimplementedError();
  }

  @override
  Future<void> toggleFavorite(Movie movie) {
    // TODO: implement toggleFavorite
    throw UnimplementedError();
  }

}