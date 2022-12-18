import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCardType2 extends StatelessWidget {
  const CustomCardType2({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      // si se sale la img, trata de recortarlo. Esto es para los bordes redondeados
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 20,
      // color de la sombra
      shadowColor: AppTheme.colorPrimary.withOpacity(0.5),
      child: Column(
        children: [
          // widget para mostrar imagenes, puede ser Image, pero usaremos otro para solucionar el problema
          // cuando tarda en cargar una imagen por la conexion de internet
          const FadeInImage(
            image: NetworkImage(
                'https://www.solofondos.com/wp-content/uploads/2015/04/Fondos-de-paisajes.jpg'),

            /// placeholder tiene que ser una imagen que ya este en el proyecto dentro
            /// de la carpeta assets que nosotros mismos creamos .gif
            /// ojo, para decirle a flutter que use la imagen que esta dentro de assets, primero tenemos que
            /// abrir el archivo pubspec.yaml y debemos quitar el comentario en:
            /// assets:
            ///   - images/a_dot_burr.jpg --> aqui tenemos que poner assets/nombreimagen.jpg o solo assets/ para
            /// traernos a todas las imagenes
            placeholder: AssetImage('assets/loading.gif'),

            // tamaños especificos
            width: double.infinity,
            height: 230,
            fit: BoxFit.cover, // la imagen se adapta
            fadeInDuration: Duration(milliseconds: 300),
          ),
          Container(
            alignment: AlignmentDirectional.centerEnd,
            padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
            child: const Text('un hermoso paisaje'),
          ),
        ],
      ),
    );
  }
}
