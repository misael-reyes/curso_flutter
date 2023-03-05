/// widgets para mostrar el carrusel de actores que aparecen en una pelicula
/// se decidio hacer un widget a parte para que en un futuro se pueda reutilizar
/// en otras vistas

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {
  //
  final int movieId;

  const CastingCards({Key? key, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //

    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.getMovieCast(movieId),
      builder: (_, AsyncSnapshot<List<Cast>> snapshot) {
        //
        if (!snapshot.hasData) {
          return Container(
            constraints: const BoxConstraints(maxWidth: 150),
            height: 180,
            child: const CupertinoActivityIndicator(),
          );
        }

        final cast = snapshot.data!;

        return Container(
          margin: const EdgeInsets.only(bottom: 30),
          width: double.infinity,
          height: 180,
          //color: Colors.red,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, int index) {
              return const _CastCard();
            },
          ),
        );
      },
    );
  }
}

// propio widget para mostrar la tarjeta
class _CastCard extends StatelessWidget {
  const _CastCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      //color: Colors.green,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('http://via.placeholder.com/150x300'),
              height: 140,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'actor.name sfkdlfjlsf afasdf',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
