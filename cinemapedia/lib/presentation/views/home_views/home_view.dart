import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// lo convertimos primero a un statefulwidget porque queremos usar
/// el initState, pero como estamos usando riverpod ahora lo convertimos
/// a ConsumerStatefulWidget y no a ConsumerWidget
class HomeView extends ConsumerStatefulWidget {
  
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState(); // tambien esto cambio
}

// ahora no será State sino ConsumerState y ahora tenemos acceso a ref en toda la clase _HomeViewState
class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();

    // como estoy dentro de un método, uso read y no watc
    // hacemos la peticion a la API para solicitar las peliculas

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    final initialLoading = ref.watch(initialLoadingProvider);

    if( initialLoading ) return const FullScreenLoader();

    // colocamos los observadores
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final upcomingMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);

    // en este ya estan solo las 6 peliculas
    final slideShowMovies = ref.watch(moviesSlideshowProvider);

    // los slivers siempre trabajarán con un CustomScrollView
    return CustomScrollView(
        // los slivers son widgets que trabajan con caracteristicas de los scrollview
        slivers: [

          const SliverAppBar(
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: CustomAppbar()
            ),
          ),

          SliverList(delegate: SliverChildBuilderDelegate((context, index) {
            return Column(
              children: [
                //const CustomAppbar(),

                /// queremos pasar solo 6 peliculas al slider, si decimos que corte el arreglo
                /// marcara un error porque al inicio el arreglo esta vacio, entonces para
                /// solucioar esto decidimos crear un nuevo provider
                MoviesSlideShow(movies: slideShowMovies),

                MovieHorizontalListview(
                    movies: nowPlayingMovies,
                    title: 'En cines',
                    subTitle: 'Lunes 20',
                    loadNextPage: () =>
                        ref.read(nowPlayingMoviesProvider.notifier).loadNextPage()),

                MovieHorizontalListview(
                    movies: upcomingMovies,
                    title: 'Próximamente',
                    subTitle: 'Este mes',
                    loadNextPage: () =>
                        ref.read(upcomingMoviesProvider.notifier).loadNextPage()),

                MovieHorizontalListview(
                    movies: popularMovies,
                    title: 'Populares',
                    // subTitle: 'Lunes 20',
                    loadNextPage: () =>
                        ref.read(popularMoviesProvider.notifier).loadNextPage()),

                MovieHorizontalListview(
                    movies: topRatedMovies,
                    title: 'Mejor calificadas',
                    subTitle: 'Desde siempre',
                    loadNextPage: () =>
                        ref.read(topRatedMoviesProvider.notifier).loadNextPage()),
              ],
            );
          }, childCount: 1))
        ]
    );
  }
}