
import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

/// Este widget tiene que ser lo más generico posible, porque en él
/// vamos a mostrar las peliculas que están en cines, las que
/// estarán proximamente y cualquier otro tipo de peliculas
/// 
/// Queremos implemetar el scroll infinito en este listview, para ello
/// necesitamos colocar un controlador al listview, es por ello que
/// convertimos este widget a un statefulwidget

class MovieHorizontalListview extends StatefulWidget {

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
  State<MovieHorizontalListview> createState() => _MovieHorizontalListviewState();
}

class _MovieHorizontalListviewState extends State<MovieHorizontalListview> {

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if(widget.loadNextPage == null) return;

      // primero necesito saber cual es la posicion actual del scroll y compararla con la maxima
      final actualPositon = scrollController.position.pixels;
      final maxPosition = scrollController.position.maxScrollExtent;

      if((actualPositon + 200) >= maxPosition) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    // cada que usemos un listener, usemos un dispose
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [

          if (widget.title != null || widget.subTitle != null)
            _Title(title: widget.title, subTitle: widget.subTitle),

          // Expanded(
            //child: Text('holamundo')
          //)
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: widget.movies.length,
              scrollDirection: Axis.horizontal,
              // especificamos la fisica para que sea igual en iOS y Android
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => _Slide(movie: widget.movies[index]),
            ),
          )

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
      //color: Colors.red,
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

class _Slide extends StatelessWidget {

  final Movie movie;

  const _Slide({ required this.movie });

  @override
  Widget build(BuildContext context) {

    final textStyle = Theme.of(context).textTheme;

    // elegimos un container porque podemos colocar margenes
    return Container(
      //color: Colors.blue,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                movie.posterPath,
                fit: BoxFit.cover,
                width: 150,
                // el loading builder es cuando ya se contruye la imagen ejecutamos esto
                loadingBuilder: (context, child, loadingProgress) {
                  if(loadingProgress != null) {
                    return const Padding(
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: CircularProgressIndicator( strokeWidth: 2 )
                      ),
                    );
                  }
                  return FadeIn(child: child);
                },
              ),
            ),
          ), 
          
          const SizedBox(height: 5),

          // Title
          SizedBox(
            width: 150,
            child: Text(
              movie.title, 
              maxLines: 2,
              style: textStyle.titleSmall,
            ),
          ),

          // Rating
          SizedBox(
            width: 150,
            child: Row(
              children: [
                Icon(Icons.star_half_outlined, color: Colors.yellow.shade800),
                const SizedBox(width: 3),
                Text('${movie.voteAverage}', style: textStyle.bodyMedium?.copyWith(color: Colors.yellow.shade800)),
                const SizedBox(width: 10),
                const Spacer(),
                Text(HumanFormats.number(movie.popularity), style: textStyle.bodySmall)
                //Text('${movie.popularity}', style: textStyle.bodySmall)
              ],
            ),
          )

        ],
      ),
    );
  }
}