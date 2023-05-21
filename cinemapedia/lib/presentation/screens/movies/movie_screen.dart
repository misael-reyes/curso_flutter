
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// convertimos este screen a un statefulwidget principalmente porque
/// queremos usar el método iniState, en este método nosotros queremos
/// cargar las peliculas, además nos sirve para saber cuando estoy 
/// cargando y cuando termine de cargar, entre otras cosas

// ahora cambiamos el stateulwidget por la representación de riverpod para tomar los scopeprovider

class MovieScreen extends ConsumerStatefulWidget {

  static const name = 'movie-screen';
  final String movieId;

  const MovieScreen({
    super.key,
    required this.movieId
  });

  @override
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<MovieScreen> {

  @override
  void initState() {
    super.initState();
    /// consultamos la pelicula, recordar que mientras estemos de un initstate
    /// un ontap o una función asi, usamos read en vez de watch, porque no podemo
    /// redibujar un initstate
    ref.read( movieInfoProvider.notifier ).loadMovie(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {

    final Movie? movie = ref.watch( movieInfoProvider )[widget.movieId];

    if( movie == null ) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('MovieID: ${widget.movieId}'),
      ),
    );
  }
}