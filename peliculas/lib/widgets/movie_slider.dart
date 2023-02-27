// la idea es hacer un widget reutilizable

import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';

class MovieSlider extends StatefulWidget {
  //
  final List<Movie> movies;
  final String? title;
  final Function onNextPage;

  const MovieSlider({super.key, required this.movies, required this.onNextPage, this.title});

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  //
  final ScrollController scrollController = ScrollController();

  /// al sobreescribir esta funcion, podemos ejecutar codigo la primera vez
  /// que este widget sea construido
  @override
  void initState() {
    super.initState();
    // ahora tenemos control sobre el scroll
    scrollController.addListener(() {
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 300) {
        // manadamos a llamar la funcion que nos pasaron como parametro
        widget.onNextPage();
      }
    });
  }

  // funcion cuando el widget va hacer destruido
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // tambien lo puede validar de esta manera
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20),
          //   child: title != null ? Text(
          //     title!,
          //     style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //   ): Container()
          // ),
          if (widget.title != null)
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  widget.title!,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),

          const SizedBox(height: 5),

          /// lisview.builder nos da un erro porque espera el ancho del padre, pero el padre que es el contenedor es flexible
          /// una solucion seria envolver este lisview en un expanded que toma todo el tamaño que esta disponible
          Expanded(
            child: ListView.builder(
                // asociamos el scroll controler con nuestro builder
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: widget.movies.length,
                // el _MoviePoster son las tarjetas del listview
                itemBuilder: (_, int index) => _MoviePoster(movie: widget.movies[index])),
          )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  //
  final Movie movie;

  const _MoviePoster({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      // color: Colors.green,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: movie),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 5),

          /// si ponemos asi el texto, sin otro atributo, nos saldra la linea
          /// amarilla que nos dice que hay elemenos
          /// que no se pueden renderisar
          Text(
            movie.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis, // esto coloca los ...
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
