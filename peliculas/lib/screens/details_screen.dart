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

    return Scaffold(
      body: CustomScrollView(
        /// los sliveres son widget que tienen cierto comportamiento preprogramado
        /// cuando se hace scroll en el contenido del padre
        /// Los widgets que van dentor de los slivers tienen que ser widgets
        /// que vengan de la familia de los slivers, por ejemplo, CustomAppBar viene
        /// de un SliverBar
        slivers: [
          const _CustomAppBar(),
          // si queremos meter widgets normales, haremos uso de SliverList
          SliverList(
              delegate: SliverChildListDelegate([const _PosterAndTitle()]))
        ],
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

class _PosterAndTitle extends StatelessWidget {
  //
  const _PosterAndTitle({super.key});

  @override
  Widget build(BuildContext context) {
    //
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: const FadeInImage(
            placeholder: AssetImage('assets/no-image.jpg'),
            image: NetworkImage('https://via.placeholder.com/200x300'),
            height: 150,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'movie.title',
              style: textTheme.headline5,

              /// esto por si tenemos un titulo muy grande que se nos salga
              /// por el espacio definido
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            Text(
              'movie.originalTitle',
              style: textTheme.subtitle1,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            Row(
              children: [
                const Icon(Icons.star_outline, size: 18, color: Colors.grey),
                const SizedBox(width: 5),
                Text(
                  'movie.voteAverage',
                  style: textTheme.caption,
                )
              ],
            )
          ],
        )
      ]),
    );
  }
}
