import 'package:flutter/material.dart';

class CustomCardType2 extends StatelessWidget {
  
  const CustomCardType2({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Column(
        children: const [
          // widget para mostrar imagenes, puede ser Image, pero usaremos otro para solucionar el problema
          // cuando tarda en cargar una imagen por la conexion de internet
          FadeInImage(
            image: NetworkImage('https://www.solofondos.com/wp-content/uploads/2015/04/Fondos-de-paisajes.jpg'),
            /// placeholder tiene que ser una imagen que ya este en el proyecto dentro
            /// de la carpeta assets que nosotros mismos creamos .gif
            /// ojo, para decirle a flutter que use la imagen que esta dentro de assets, primero tenemos que
            /// abrir el archivo pubspec.yaml y debemos quitar el comentario en:
            /// assets:
            ///   - images/a_dot_burr.jpg --> aqui tenemos que poner assets/nombreimagen.jpg o solo assets/ para
            /// traernos a todas las imagenes
            placeholder: AssetImage('assets/loading.gif'),
          )
        ],
      ),
    );
  }
}
