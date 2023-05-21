
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
      body: CustomScrollView(
        // con clampingscrollphysics evitamos el rebote que tiene en iOS
        physics: const ClampingScrollPhysics(),
        slivers: [
          _CustomSliverAppBar(movie: movie)
        ],
      ),
    );
  }
}

class _CustomSliverAppBar extends StatelessWidget {

  final Movie movie;

  const _CustomSliverAppBar({
    required this.movie
  });

  @override
  Widget build(BuildContext context) {

    // dimensiones del dispositivo
    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7, // 70% de la pantalla
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(left: 5, bottom: 15),
        //centerTitle: true,
        title: Text(
          movie.title,
          style: const TextStyle(fontSize: 20),
          textAlign: TextAlign.start,
        ),
        background: Stack(
          children: [
            // el sizedbox se expandira hasta donde lo permita el padre
            SizedBox.expand(
              child: Image.network(
                movie.posterPath,
                fit: BoxFit.cover,
              ),
            ),

            // implementaremos gradientes para los fondos claros
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    // stops: empieza en el 70% del sizedBox y termina en el 100%
                    stops: [0.7, 1.0],
                    colors: [
                      Colors.transparent,
                      Colors.black87
                    ]
                  )
                )
              ),
            ),

            // gradiente también para la flecha de arriba
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    // stops: empieza en el 70% del sizedBox y termina en el 100%
                    stops: [0.0, 0.3],
                    colors: [
                      Colors.black87,
                      Colors.transparent
                    ]
                  )
                )
              ),
            )

          ],
        ),
      ),
    );
  }
}