import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/widgets/widgets.dart';

/// vista donde se muestra el detalle de la pelicula

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);
  // tambien lo podemos hacer de la siguiente manera
  // const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // vamos a recibir los argunmentos
    // ojo, no estamos diciendo que lo convierta a un Movie, sino que lo trate como un Movie
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      body: CustomScrollView(
        /// los sliveres son widget que tienen cierto comportamiento preprogramado
        /// cuando se hace scroll en el contenido del padre
        /// Los widgets que van dentor de los slivers tienen que ser widgets
        /// que vengan de la familia de los slivers, por ejemplo, CustomAppBar viene
        /// de un SliverBar
        slivers: [
          _CustomAppBar(backdropPath: movie.fullBackdropPath, title: movie.title),
          // si queremos meter widgets normales, haremos uso de SliverList
          SliverList(
              delegate: SliverChildListDelegate([
            _PosterAndTitle(
                poster: movie.fullPosterImg,
                title: movie.title,
                originalTitle: movie.originalTitle,
                voteAverage: movie.voteAverage),
            _Overview(overview: movie.overview),
            _Overview(overview: movie.overview),
            _Overview(overview: movie.overview),
            // necesitamos mandar el id de la movie para obtener a sus actores
            CastingCards(movieId: movie.id,)
          ]))
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  // elementos para el customAppBar
  final String backdropPath;
  final String title;

  const _CustomAppBar({Key? key, required this.backdropPath, required this.title}) : super(key: key);

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
          padding: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
          // fondo medio transparente
          color: Colors.black12,
          child: Text(
            title,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
        // FadeInImage siempre muestra primero una foto como de carga antes de mostrar la foto real
        background: FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'),
          image: NetworkImage(backdropPath),
          // expandimos la imagen sin perder dimensiones
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  //
  final String poster;
  final String title;
  final String originalTitle;
  final double voteAverage;
  const _PosterAndTitle(
      {super.key, required this.poster, required this.title, required this.originalTitle, required this.voteAverage});

  @override
  Widget build(BuildContext context) {
    //
    final TextTheme textTheme = Theme.of(context).textTheme;

    // esto es para corregir el erro de tamanio
    // obtenemos el tamanio de la pantalla
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: NetworkImage(poster),
              height: 150,
              width: 110),
        ),
        const SizedBox(
          width: 20,
        ),
        // tenemos que envolver a column en un Boxconstraint para corregir el error

        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: size.width - 190),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: textTheme.headline5,
        
                /// esto por si tenemos un titulo muy grande que se nos salga
                /// por el espacio definido
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                originalTitle,
                style: textTheme.subtitle1,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Row(
                children: [
                  const Icon(Icons.star_outline, size: 18, color: Colors.grey),
                  const SizedBox(width: 5),
                  Text(
                    voteAverage.toString(),
                    style: textTheme.caption,
                  )
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}

class _Overview extends StatelessWidget {
  //
  final String overview;

  const _Overview({super.key, required this.overview});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        overview,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
