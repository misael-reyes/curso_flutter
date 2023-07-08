import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  
  @override
  void initState() {
    super.initState();
    // hacemos la petición a la BD de las películas favoritas
    ref.read( favoriteMoviesProvider.notifier ).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    /// colocamos los observadores
    /// accedemos al estado que en este caso es un mapa y lo convertimos a lista
    final favoriteMovies = ref.watch( favoriteMoviesProvider ).values.toList();
    
    return Scaffold(
      body: MovieMasonry(movies: favoriteMovies)
    );
  }
}