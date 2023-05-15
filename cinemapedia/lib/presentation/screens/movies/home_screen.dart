import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {

  static const name = 'home-screen';
  
  const HomeScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView()
    );
  }
}


/// lo convertimos primero a un statefulwidget porque queremos usar 
/// el initState, pero como estamos usando riverpod ahora lo convertimos
/// a ConsumerStatefulWidget y no a ConsumerWidget
class _HomeView extends ConsumerStatefulWidget {

  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState(); // tambien esto cambio
}

// ahora no será State sino ConsumerState y ahora tenemos acceso a ref en toda la clase _HomeViewState
class _HomeViewState extends ConsumerState<_HomeView> {

  @override
  void initState() {
    super.initState();

    // como estoy dentro de un método, uso read y no watch
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    // aquí si usamos watch porque necesitamos estar al pendiente de los cambios
    final nowPlayingMovies = ref.watch( nowPlayingMoviesProvider );

    return ListView.builder(
      itemCount: nowPlayingMovies.length,
      itemBuilder: (context, index) {
        final movie = nowPlayingMovies[index];
        return ListTile(
          title: Text( movie.title ),
        );
      },
    );
  }
}