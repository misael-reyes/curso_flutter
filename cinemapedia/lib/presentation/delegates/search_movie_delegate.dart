
import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

typedef SearchMoviesCallback = Future<List<Movie>> Function( String query );

class SearchMovieDelegate extends SearchDelegate<Movie?> {

  final SearchMoviesCallback searchMovies;
  /// we need these objects to solve the problem of performing
  /// the search every time after a certain period of time.
  /// 
  /// If you need a multiple broadcast stream, i.e. several subscribers
  /// can receive the events at the same time, use StreamController.broadcast().
  /// If you only need a single broadcast stream, where only one subcriber can be
  /// active at a time, use StreamController().
  StreamController<List<Movie>> debouncedMovies = StreamController.broadcast();
  Timer? _debounceTimer;

  SearchMovieDelegate({
    required this.searchMovies
  });

  void _onQueryChanged( String query ) {
    print('query string cambio');
    if( _debounceTimer?.isActive ?? false ) _debounceTimer!.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 500), () { 
      print('buscando  movies');
    });
  }

  @override
  String? get searchFieldLabel => 'Buscar película';

  @override
  List<Widget>? buildActions(BuildContext context) {

    return [
      //if(query.isNotEmpty)
      FadeIn(
        animate: query.isNotEmpty,
        // duration: const Duration(milliseconds: 200),
        child: IconButton(
          // limpiamos la caja de texto
          onPressed: () => query = '',
          icon: const Icon(Icons.clear),
        ),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      // retornamos un null porque el icon button es para regresar
      onPressed: () => close(context, null), 
      icon: const Icon(Icons.arrow_back_ios_new_rounded)
    ); 
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('BuildResults');  
  }

  // buildSuggestions se ejecutara cada que se escribe en el buscador
  @override
  Widget buildSuggestions(BuildContext context) {

    _onQueryChanged(query);

    // Necesitamos crear el widget a partir de un Future, por eso usamos FutureBuilder
    // now we change it to a StreamBuilder
    return StreamBuilder(
      //future: searchMovies( query ),
      stream: debouncedMovies.stream,
      builder: (context, snapshot) {

        final movies = snapshot.data ?? [];

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) => _MovieItem(
            movie: movies[index],
            onMovieSelected: close,
          ),
        );
      },
    );
  }

}

class _MovieItem extends StatelessWidget {

  final Movie movie;
  final Function onMovieSelected;

  const _MovieItem({ 
    required this.movie,
    required this.onMovieSelected,
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final textStyles = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        onMovieSelected(context, movie);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            // Image
            SizedBox(
              width: size.width * .2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network( 
                  movie.posterPath,
                  loadingBuilder: (context, child, loadingProgress) => FadeIn(child: child), 
                ),
              ),
            ),
    
            const SizedBox( width: 10 ),
    
            // Description
            SizedBox(
              width: size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title, style: textStyles.titleMedium),
                  
                  movie.overview.length > 100
                    ? Text( '${movie.overview.substring(0,100)}...' )
                    : Text(movie.overview),
                  
                  Row(
                    children: [
                      Icon(Icons.star_half_rounded, color: Colors.yellow.shade800),
                      const SizedBox(width: 5),
                      Text(
                        HumanFormats.number(number: movie.voteAverage, decimals: 1), 
                        style: textStyles.bodyMedium!.copyWith(color: Colors.yellow.shade900),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}