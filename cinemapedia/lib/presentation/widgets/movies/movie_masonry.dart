import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

/// como yo ya se que usare un infinite scroll, necesito
/// poner un listener al controler, por lo tanto necesitamos un 
/// statefulwidget


class MovieMasonry extends StatefulWidget {
  // necesitamos el listado de peliculas
  final List<Movie> movies;
  final VoidCallback? loadNextPage;

  const MovieMasonry({
    super.key, 
    required this.movies, 
    this.loadNextPage
  });

  @override
  State<MovieMasonry> createState() => _MovieMasonryState();
}

class _MovieMasonryState extends State<MovieMasonry> {

  final scrollController = ScrollController();

  /// si queremos estar al pendiente del controlador, tenemos que sobreescribir al metodo
  /// initState
  
  @override
  void initState() {
    super.initState();
    
    scrollController.addListener(() {
      if( widget.loadNextPage == null ) return;

      // calculamos la posición actual
      final actualPosition = scrollController.position.pixels;
      final maxPosition = scrollController.position.maxScrollExtent;

      if( (actualPosition + 150) >= maxPosition ) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    // cada que usemos un listener, usaremos un dispose
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //print('el tamanio es: ${widget.movies.length}');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: MasonryGridView.count(
        controller: scrollController,
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemCount: widget.movies.length,
        itemBuilder: (context, index) {
          if( index == 1 ) {
            return Column(
              children: [
                const SizedBox(height: 40),
                MoviePosterLink( movie: widget.movies[index] )
              ],
            );
          }
          return MoviePosterLink( movie: widget.movies[index] );
        },
      ),
    );
  }
}