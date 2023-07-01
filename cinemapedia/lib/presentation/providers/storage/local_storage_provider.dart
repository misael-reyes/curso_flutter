
import 'package:cinemapedia/infrastructure/datasources/isar_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/local_storage_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Este provider será el encargado de crear la instancia de 
/// nuestra implementación de local storage repository
/// Este provider no va a cambiar, es decir, una vez creado jamás será
/// modificado, es por eso que usamos Provider que solo permite la lectura
/// 
/// Segiremos trabajando con flutter_riverpod para la gestión de estados

final localStorageRepositoryProvider = Provider((ref) {
  return LocalStorageRepositoryImp( IsarDatasource() );
});