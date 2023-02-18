// la idea es hacer un widget reutilizable

import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';

class MovieSlider extends StatelessWidget {
  //
  final List<Movie> movies;
  final String? title;

  const MovieSlider({super.key, required this.movies, this.title});

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
          if (title != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                title!,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ),

          const SizedBox(height: 5),

          /// lisview.builder nos da un erro porque espera el ancho del padre, pero el padre que es el contenedor es flexible
          /// una solucion seria envolver este lisview en un expanded que toma todo el tamaño que esta disponible
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                // el _MoviePoster son las tarjetas del listview
                itemBuilder: (_, int index) => _MoviePoster(movie: movies[index])
            ),
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
            onTap: () => Navigator.pushNamed(context, 'details', arguments: 'argumentos'),
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
