
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';

import 'package:cinemapedia/domain/entities/movie.dart';

class MoviesSlideShow extends StatelessWidget {

  final List<Movie> movies;
  
  const MoviesSlideShow({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    
    return SizedBox(
      height: 210,
      width: double.infinity,
      // https://pub.dev/packages/card_swiper
      child: Swiper(
        // la paginacion lo podemos dejar asi, pero nosotros lo queremos personalizar
        // pagination: SwiperPagination.dots,
        pagination: SwiperPagination(
          margin: const EdgeInsets.only(top: 0),
          builder: DotSwiperPaginationBuilder(
            activeColor: colors.primary,
            color: colors.secondary
          )
        ),
        viewportFraction: 0.8,
        scale: 0.9,
        autoplay: true,
        duration: 1000,
        itemCount: movies.length,
        itemBuilder: (context, index) => _Slide(movie: movies[index])
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final Movie movie;

  const _Slide({ required this.movie });

  @override
  Widget build(BuildContext context) {

    // la intención de este decoration es dar una sombra a la imagen
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Colors.black45,
          blurRadius: 10,
          offset: Offset(0, 10) // difuminado
        )
      ]
    );

    return Padding(
      padding: const EdgeInsets.only( bottom: 30 ),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            movie.backdropPath,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              /// lo que estamos haciendo aquí es preguanr si aun esta cargando la imagen
              /// colocams un decoratedbox, caso contrario retornamos el hijo, que es 
              /// practicamente la imagen
              if( loadingProgress != null ) {
                return const DecoratedBox(
                  decoration: BoxDecoration( color: Colors.black12 ),
                );
              }
              return FadeIn(child: child);
            },
          )
        )
      ),
    );
  }
}