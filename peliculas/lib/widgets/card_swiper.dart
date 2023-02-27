import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';

class CardSwiper extends StatelessWidget {
  //
  final List<Movie> movies;

  const CardSwiper({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    /// recordar que con mediaquery nosotros conocemos las especificaciones de
    /// nuestro dispositivo en el que se este ejecutando la app

    final size = MediaQuery.of(context).size;

    if (movies.isEmpty) {
      return Container(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    return Container(
      width: double.infinity, // todo el ancho posible
      height: size.height * 0.5, // %50 de la pantalla
      //color: Colors.red,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        // funcion que se ejecutara para construir el builder
        // si no usaremos un paraemtro, lo podemos sustituir por un _
        itemBuilder: (BuildContext context, int index) {
          //
          final movie = movies[index];

          // el widget a retornar sera utilizado para renderisar la tarjeta
          // el gesturedetector es para dar evento al clic
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: movie),
            // el cliprrect es para mostrar el border radius
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/loading.gif'),
                image: NetworkImage(movie.fullPosterImg),
                // el fit es para adaptar la imagen al tamaño que tiene el contenedor padre
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
