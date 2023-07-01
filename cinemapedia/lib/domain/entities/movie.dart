import 'package:isar/isar.dart';

// al inicio marcara error pero es normal, hasta que ejecutemos el comando
// flutter pub run build_runner build
// esto nos generará un archivo en la carpeta de este archivo
part 'movie.g.dart';

// tenemos que colocar collection para indicarle a isar que Movie es una entidad de la BD
// esto lo encontramos en la documentación de isar
// https://isar.dev/tutorials/quickstart.html#_1-add-dependencies

@collection
class Movie {

  Id? isarId; // isar nos dará un id de forma automatica

  final bool adult;
  final String backdropPath;
  final List<String> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final DateTime releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  Movie({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount
  });
}