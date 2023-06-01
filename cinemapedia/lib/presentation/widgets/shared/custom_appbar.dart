import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/delegates/search_movie_delegate.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomAppbar extends ConsumerWidget {

  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      //bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(Icons.movie_outlined, color: colors.primary),
              const SizedBox(width: 5),
              Text('Cinemapedia', style: titleStyle),
              // usamos spacer para que tome todo    el espacio que queda
              const Spacer(),
              IconButton(
                onPressed: () {

                  // final movieRepository = ref.read( movieRepositoryProvider );
                  final searchedMovies = ref.read(searchedMoviesProvider);
                  final searchQuery = ref.read( searchQueryProvider );

                  showSearch<Movie?>(
                    // we can send the query
                    query: searchQuery,
                    context: context, 
                    // el delegate es el encargado de trabajar la busqueda
                    delegate: SearchMovieDelegate(
                      initialMovies: searchedMovies,
                      searchMovies: ref.read(searchedMoviesProvider.notifier).searchMoviesByQuery,
                    )
                  ).then((movie) {
                    // we send the user to the other screen

                    /// it is not recommended to place the context after an await
                    /// that is why we rewrite the code using the function then()
                    if(movie == null) return;
                    context.push('/movie/${ movie.id }');
                  });
                }, 
                icon: const Icon(Icons.search)
              )
            ],
          ),
        ),
      ),
    );
  }
}