import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {

  final String title;
  final String caption;
  final String imageUrl;

  // lo ponemos de manera posicional
  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo('Busca la comida', 'Magna proident ut qui irure minim laborum ad minim mollit officia eiusmod incididunt.', 'assets/images/1.png'),
  SlideInfo('Entrega rápida', 'Nulla eiusmod reprehenderit ullamco id.', 'assets/images/2.png'),
  SlideInfo('Disfruta la comida', 'Proident esse nostrud id consectetur dolor.', 'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    
    // aquí colocaremos el listener a nuestro controller
    pageViewController.addListener(() { 
      // imprimimos la pagina actual
      // print('Pagina actual: ${pageViewController.page}');

      final page = pageViewController.page ?? 0;

      if ( !endReached && page >= ( slides.length - 1.5 ) ) {
        setState(() => endReached = true);
      }

    });
  }

  @override
  void dispose() {
    /// es buena practica al usar listeners o controladores, eliminarlos
    /// en esta etapa de vida del widget para limpiar memoria
    
    pageViewController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [

          PageView(
            /// usamos un controlador porque él nos dirá cuando nos encontremos en el 
            /// último slider y asi podremos mostrar un widget, es por eso que la clase 
            /// AppTutorialScreen la tuvimos que convertir a un StatefulWidget
            controller: pageViewController,
            // recordar que esto es para quitar el rebote, asi tenemos lo mismo en ios y android
            physics: const BouncingScrollPhysics(),
            children: slides.map(
              (slideData) => _Slide(
                title: slideData.title, 
                caption: slideData.caption, 
                imageUrl: slideData.imageUrl
              )
            ).toList()
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: () => context.pop(), 
              child: const Text('Salir')
            )
          ),

          // la idea es mostrar este boton solo cuando se llegue al final
          endReached ? 
            Positioned(
              bottom: 30,
              right: 30,
              // animamos la entrada del boton con la libreria animate_do
              child: FadeInRight(
                from: 15,
                delay: const Duration(milliseconds: 500),
                child: FilledButton(
                  onPressed: () => context.pop(), 
                  child: const Text('Comenzar')
                ),
              )
            )
          : const SizedBox()

        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title, 
    required this.caption, 
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 10),
            Text(caption, style: captionStyle)
          ],
        ),
      ),
    );
  }
}
