
import 'package:cinemapedia/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Este provider será el encargado de crear la instancia de 
/// nuestra implementación de movies repository
/// Este provider no va a cambiar, es decir, una vez creado jamás será
/// modificado, es por eso que usamos Provider que solo permite la lectura
/// 
/// Segiremos trabajando con flutter_riverpod para la gestión de estados

final movieRepositoryProvider = Provider((ref) {

  return MovieRepositoryImpl( MovieDbDatasource() );
});