import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    /// lo que le estamos diciendo aqui es que vaya al arbol de widget y nos traiga
    /// la primera instancia que encuentre sobre MoviesProvider, si no encuntra una instacia, va
    /// a crear uno siempre y cuando en MultiProvider tenga definido MoviesProvider
    /// (esto se encuentra en el main)
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Películas en cines'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),

      /// como nuestro colum es muy alto, nos marca un error en la pantalla porque no se
      /// puede mostrar todo, una tecnica para resolverlo es envolverlo dentro de un
      /// singlechildscrollview y este nos permitira hacer scroll para ver el resto del widget
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Tarjetas principales
            CardSwiper(movies: moviesProvider.onDisplayMovies),

            // Slider de peliculas
            MovieSlider(
              movies: moviesProvider.popularMovies,
              title: 'Populares',
            )
          ],
        ),
      ),
    );
  }
}
