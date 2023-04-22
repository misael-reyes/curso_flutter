
import 'package:flutter/material.dart';
import 'package:toktik/presentation/widgets/video/video_background.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {
  
  final String videoUrl;
  final String caption;
  
  const FullScreenPlayer({
    super.key,
    required this.videoUrl,
    required this.caption
  });

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  
  /// como accedemos a las propiedades de FullScreenPlayer?
  /// lo acemos de la siguiente manera:
  /// widget.videoUrl y widget.caption

  late VideoPlayerController controller;
  
  // podemos sobreescribir initState porque un StatefulWidget si tiene un ciclo de vida
  @override
  void initState() {
    super.initState();
    
    // hacemos la inicialización del video
    controller = VideoPlayerController.asset( widget.videoUrl )
      ..setVolume(0)
      ..setLooping(true)
      ..play();
  }
  
  @override
  void dispose() {
    // esto es para evitar algun tipo de fuga de memoria
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {
        if( snapshot.connectionState != ConnectionState.done ) {
          return const Center(
              child: CircularProgressIndicator(
            strokeWidth: 2,
            color: Colors.red,
          ));
        }
        /// GestureDetector es un detector de gestos
        /// lo usaremos para poner play y pause al video
        return GestureDetector(
          onTap: () {
            if(controller.value.isPlaying) {
              controller.pause();
              return;
            }
            // lo hacemos de esta manera para tratar de no usar el else
            controller.play();
          },
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: Stack(
              children: [
                VideoPlayer(controller),
                
                // gradiente
                VideoBackground(
                  /// esto quiere decir que los gradientes comenzaran en
                  /// el 80% de la pantalla y terminaran en la totalidad de la 
                  /// pantalla
                  stops: const [0.8,1.0],
                ),
                
                // texto
                Positioned(
                  bottom: 50,
                  left: 20,
                  child: _VideoCaption(caption: widget.caption)
                )
              ]
            )
          ),
        ); 
      },
    );
  }
}

class _VideoCaption extends StatelessWidget {
  
  final String caption;
  
  const _VideoCaption({super.key, required this.caption});

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    // al hacer esto, nosotros podemos configurar nuestro tema de manera global y luego tomar una referencia
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    
    return SizedBox(
      // asi hacemos si queremos tomar el 60% de la pantalla del dispositivo
      width: size.width * 0.6,
      child: Text(caption, maxLines: 2, style: titleStyle),
    );
  }
}