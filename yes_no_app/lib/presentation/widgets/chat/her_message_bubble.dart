import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  final String textMessage;
  
  const HerMessageBubble({super.key, required this.textMessage});

  @override
  Widget build(BuildContext context) {
    // busca el tema dentro del contexto
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              textMessage,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5),

        // image
        _ImageBubble(),
        const SizedBox(height: 10)
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // esto es para saber las dimensiones del dispositivo en el que se esta ejecutando la app
    final size = MediaQuery.of(context).size;

    // ClipRRect nos permite hacer bordes redondeados
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          'https://yesno.wtf/assets/yes/3-422e51268d64d78241720a7de52fe121.gif',
          width: size.width * 0.7,
          height: 150,
          // con boxfit decimos que basado en las dimensiones que le estamos dando coloque la imagen
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
              width: size.width * 0.7,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Text('mi amor esta enviando un mensaje'),
            );
          },
        ));
  }
}
