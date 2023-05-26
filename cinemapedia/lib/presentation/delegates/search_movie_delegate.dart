
import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

typedef SearchMoviesCallback = Future<List<Movie>> Function( String query );

class SearchMovieDelegate extends SearchDelegate<Movie?> {

  final SearchMoviesCallback searchMovies;

  SearchMovieDelegate({
    required this.searchMovies
  });

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
    // Necesitamos crear el widget a partir de un Future, por eso usamos FutureBuilder
    return FutureBuilder(
      future: searchMovies( query ),
      builder: (context, snapshot) {

        final movies = snapshot.data ?? [];

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {

            final movie = movies[index];

            return ListTile(
              title: Text(movie.title),
            );
          },
        );
      },
    );
  }

}