import 'package:flutter/material.dart';

/// vista donde se muestra el detalle de la pelicula

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);
  // tambien lo podemos hacer de la siguiente manera
  // const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // vamos a recibir los argunmentos
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return const Scaffold(
      body: CustomScrollView(
        /// los sliveres son widget que tienen cierto comportamiento preprogramado
        /// cuando se hace scroll en el contenido del padre
        slivers: [_CustomAppBar()],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    /// el SileverAppBar es muy parecido al AppBar, solo que tiene
    /// un comportamiento cuando se hace scroll
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          // fondo medio transparente
          color: Colors.black12,
          child: const Text(
            'movie.title',
            style: TextStyle(fontSize: 16),
          ),
        ),
        // FadeInImage siempre muestra primero una foto como de carga antes de mostrar la foto real
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'), 
          image: NetworkImage('https://via.placeholder.com/500x300'),
          // expandimos la imagen sin perder dimensiones
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
