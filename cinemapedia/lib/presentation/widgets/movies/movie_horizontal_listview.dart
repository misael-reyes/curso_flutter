
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

/// Este widget tiene que ser lo más generico posible, porque en él
/// vamos a mostrar las peliculas que están en cines, las que
/// estarán proximamente y cualquier otro tipo de peliculas

class MovieHorizontalListview extends StatelessWidget {

  // películas a mostrar
  final List<Movie> movies;
  final String? title;
  final String? subTitle;
  /// VoidCallback es un tipo de función que se utiliza 
  /// para definir devoluciones de llamada sin argumentos 
  /// ni valor de retorno en Dart.
  final VoidCallback? loadNextPage;
  
  const MovieHorizontalListview({
    super.key, 
    required this.movies,
    this.title,
    this.subTitle,
    this.loadNextPage
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [

          if (title != null || subTitle != null)
            _Title(title: title, subTitle: subTitle)

        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {

  final String? title;
  final String? subTitle;

  const _Title({this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {

    final textStyle = Theme.of(context).textTheme.titleLarge;

    return Container(
      color: Colors.red,
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          
          if(title != null) Text(title!, style: textStyle),

          const Spacer(),

          if(subTitle != null)
            FilledButton.tonal(
              style: const ButtonStyle(visualDensity: VisualDensity.compact),
              onPressed: (){}, 
              child: Text(subTitle!)
            )

        ],
      ),
    );
  }
}