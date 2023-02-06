import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    /// recordar que con mediaquery nosotros conocemos las especificaciones de
    /// nuestro dispositivo en el que se este ejecutando la app

    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity, // todo el ancho posible
      height: size.height * 0.5, // %50 de la pantalla
      //color: Colors.red,
      child: Swiper(
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        // funcion que se ejecutara para construir el builder
        // si no usaremos un paraemtro, lo podemos sustituir por un _
        itemBuilder: (BuildContext context, int index) {
          // el widget a retornar sera utilizado para renderisar la tarjeta
          // el gesturedetector es para dar evento al clic
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: 'argumentos'),
            // el cliprrect es para mostrar el border radius
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                  placeholder: AssetImage('assets/loading.gif'),
                  image: NetworkImage('https://via.placeholder.com/300x400'),
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
