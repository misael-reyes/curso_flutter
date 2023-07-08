import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MoviePosterLink extends StatelessWidget {

  final Movie movie;

  const MoviePosterLink({
    super.key,
    required this.movie
  });

  @override
  Widget build(BuildContext context) {
    // GestureDetector porque usaremos queremos el ontap
    return GestureDetector(
      onTap: () => context.push('/movie/${ movie.id }'),
      // ClipRRect porque usaremos bordes
      child: ClipRRect(
        child: FadeIn(
          child: Image.network(movie.posterPath),
        ),
      ),
    );
  }
}