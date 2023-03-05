import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

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

  Widget _emptyContainer() {
    return Container(
      child: const Center(child: Icon(Icons.movie_creation_outlined, color: Colors.black38, size: 130)),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      //_emptyContainer();
      return Container(
        child: const Center(child: Icon(Icons.movie_creation_outlined, color: Colors.black38, size: 130)),
      );
      //return Text('query: $query');
      //return Text('query vacio');
    }

    /// gracias a que nuestro provider esta al inicio del arbol, podemos acceder a el desde
    /// cualquier parte de la app
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.searchMovies(query),
      builder: (_, AsyncSnapshot<List<Movie>> snapshot) {
        if (!snapshot.hasData) return Text('snapshot sin datos');

        final movies = snapshot.data!;

        return ListView.builder(itemCount: movies.length, itemBuilder: (_, int index) => _MovieItem(movies[index]));
      },
    );
  }
}

class _MovieItem extends StatelessWidget {
  //
  final Movie movie;

  const _MovieItem(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FadeInImage(
        placeholder: const AssetImage('assets/no-image.jpg'),
        image: NetworkImage(movie.fullPosterImg),
        width: 50,
        fit: BoxFit.contain,
      ),
      title: Text(movie.title),
      subtitle: Text(movie.originalTitle),
      onTap: () {
        // nos vamos a otra pantalla
        Navigator.pushNamed(context, 'details', arguments: movie);
      },
    );
  }
}
