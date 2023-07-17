import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// recordar que como estamos usando reverpod, para tener el objeto ref
/// cambiamos:
/// StatefulWidget -> ConsumerStatefulWidget
/// State< > -> ConsumerState< > 
/// también recordemos que en este caso estamos usanod un statefulwidget
/// porque necesitamos hacer uso del método init, cosa que no podemos
/// con el staleswidget

class FavoritesView extends ConsumerStatefulWidget {

  const FavoritesView({super.key});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {

  bool isLastPage = false;
  bool isLoading = false;
  
  @override
  void initState() {
    super.initState();
    // hacemos la petición a la BD de las películas favoritas
    loadNextPage();
    // ref.read( favoriteMoviesProvider.notifier ).loadNextPage();
  }

  void loadNextPage() async {
    
    if(isLoading || isLastPage) return;

    isLoading = true;
    final movies = await ref.read(favoriteMoviesProvider.notifier).loadNextPage();
    isLoading = false;

    if(movies.isEmpty) {
      isLastPage = true;
    }

  }

  @override
  Widget build(BuildContext context) {

    /// colocamos los observadores
    /// accedemos al estado que en este caso es un mapa y lo convertimos a lista
    final favoriteMovies = ref.watch( favoriteMoviesProvider ).values.toList();

    if( favoriteMovies.isEmpty ) {

      final colors = Theme.of(context).colorScheme;

      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.favorite_outline_sharp, size: 60, color: colors.primary),
            Text('Ohhh no!!', style: TextStyle(fontSize: 30, color: colors.primary)),
            const Text('No tienes películas favoritas', style: TextStyle(fontSize: 20, color: Colors.black45)),
            const SizedBox(height: 20),
            FilledButton.tonal(
              onPressed: () => context.go('/'), 
              child: const Text('Empieza a buscar')
            )
          ],
        )
      );
    }
    
    return Scaffold(
      body: MovieMasonry(
        movies: favoriteMovies,
        loadNextPage: loadNextPage,
      )
    );
  }
}