import 'package:flutter/material.dart';

/// convertimos este screen a un statefulwidget principalmente porque
/// queremos usar el método iniState, en este método nosotros queremos
/// cargar las peliculas, además nos sirve para saber cuando estoy 
/// cargando y cuando termine de cargar, entre otras cosas

class MovieScreen extends StatefulWidget {

  static const name = 'movie-screen';
  final String movieId;

  const MovieScreen({
    super.key,
    required this.movieId
  });

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {

  @override
  void initState() {
    super.initState();
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MovieID: ${widget.movieId}'),
      ),
    );
  }
}