import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  
  static const name = 'infinite_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {

  List<int> imagesIds = [1,2,3,4,5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      /// para eliminar el espacio de la parte superior donde viene el nivel de bateria, envolvemos
      /// nuestro ListView dentro de un MediaQuery.removePadding y asignamos las siguientes propiedades
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        // esto es para el espacio en blanco que deja en Ios
        removeBottom: true,
        child: ListView.builder(
          itemCount: imagesIds.length,
          itemBuilder: (context, index) {
            /// recordar que el FadeInImage nos permite cargar una imagen de internet, pero
            /// mientras carga, podemos mostrar otra imagen como placeHolder
            return FadeInImage(
              fit: BoxFit.cover,
              width: double.infinity,
              height: 300,
              placeholder: const AssetImage('assets/images/jar-loading.gif'), 
              image: NetworkImage('https://picsum.photos/id/${imagesIds[index]}/500/300')
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_outlined),
        onPressed: () => context.pop(),
      ),
    );
  }
}
