
import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class SearchMovieDelegate extends SearchDelegate<Movie?> {

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

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Text('BuildSuggestions'); 
  }

}