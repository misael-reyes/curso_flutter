import 'package:flutter/material.dart';

class SlideInfo {

  final String title;
  final String capiton;
  final String imageUrl;

  // lo ponemos de manera posicional
  SlideInfo(this.title, this.capiton, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo('Busca la comida', 'Magna proident ut qui irure minim laborum ad minim mollit officia eiusmod incididunt.', 'assets/images/1.png'),
  SlideInfo('Entrega rápida', 'Nulla eiusmod reprehenderit ullamco id.', 'assets/images/2.png'),
  SlideInfo('Disfruta la comida', 'Proident esse nostrud id consectetur dolor.', 'assets/images/3.png'),
];

class AppTutorialScreen extends StatelessWidget {
  
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        // recordar que esto es para quitar el rebote, asi tenemos lo mismo en ios y android
        physics: const BouncingScrollPhysics(),
        children: slides.map(
          (slideData) => _Slide(
            title: slideData.title, 
            capiton: slideData.capiton, 
            imageUrl: slideData.imageUrl
          )
        ).toList()
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final String title;
  final String capiton;
  final String imageUrl;

  const _Slide({
    required this.title, 
    required this.capiton, 
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
