import 'package:flutter/material.dart';

/// delegate para el icono de busqueda
///
class MovieSearchDelegate extends SearchDelegate {
  //
  @override
  String? get searchFieldLabel => 'Buscar película';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          // limpiamos el buscador, query es el texto que introducimos
          onPressed: () => query = '',
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          // no regresamos nada porque el usuario cancelo
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container(
        child: const Center(child: Icon(Icons.movie_creation_outlined, color: Colors.black38, size: 130)),
      );
    }

    return Container();
  }
}
