// la idea es hacer un widget reutilizable

import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Populares',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 5),

          /// lisview.builder nos da un erro porque espera el ancho del padre, pero el padre que es el contenedor es flexible
          /// una solucion seria envolver este lisview en un expanded que toma todo el tamaño que esta disponible
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                // el _MoviePoster son las tarjetas del listview
                itemBuilder: (_, int index) => const _MoviePoster()),
          )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster({super.key});

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
              child: const FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'), 
                image: NetworkImage('https://via.placeholder.com/300x400'),
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
          const Text(
            'StarWars: El retorno del nuevo jedi Silvestre de Monte Cristo',
            maxLines: 2,
            overflow: TextOverflow.ellipsis, // esto coloca los ...
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
