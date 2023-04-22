import 'package:flutter/material.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';
import 'package:toktik/presentation/widgets/video/fullscreen_player.dart';

import '../../../domain/entities/video_post.dart';

class VideoScrollableView extends StatelessWidget {
  
  final List<VideoPost> videos;
  
  const VideoScrollableView({
    super.key,
    required this.videos
  });

  @override
  Widget build(BuildContext context) {
    /// el PägeView es como los anuncios de como funciona nuestra app al inicio
    /// de su instalación, es como un scroll de toda la pantalla
    /// 
    /// si solo ponemos PageView, sus hijos se crearan todos al mismo tiempo, será una
    /// gastadera de memoria, imaginemos que tenemos 100 videos, se crearan los 100 videos
    /// y solo se mostrara uno a la vez. para solucionar esto es mejor usar PageView.builder
    /// eso nos permitirá crear los videos bajo demanda, es decir, solo los que necesitaremos
    /// y entonces cambiariamos children por itemBuilder, muy similar a como trabajamos con listas
    return PageView.builder(
      // lo ponemos en vertical
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final videoPost = videos[index];
        
        // construcción de la pantalla
        return Stack(
          children: [
            // video player + gradiente
            // en unos casos no es necesario usar el .expand
            SizedBox.expand(
              child: FullScreenPlayer(
                caption: videoPost.caption,
                videoUrl: videoPost.videoUrl,
              )
            ),
            
            // botones
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(video: videoPost)
            )
          ],
        );
      },
    );
  }
}