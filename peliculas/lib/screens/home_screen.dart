import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          children: const [
            // Tarjetas principales
            CardSwiper(),
      
            // Slider de peliculas
            MovieSlider()
          ],
        ),
      ),
    );
  }
}
