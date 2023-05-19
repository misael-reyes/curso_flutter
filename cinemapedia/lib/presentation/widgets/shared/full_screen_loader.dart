import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {

  const FullScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Espere por favor'),
          const SizedBox(height: 10),
          const CircularProgressIndicator(strokeWidth: 2),
          const SizedBox(height: 10),

          // mostramos los mensajes de la lista
          StreamBuilder(
            stream: getLoadingMessages(),
            builder: (context, snapshot) {
              if( !snapshot.hasData ) return const Text('Cargando...');

              return Text(snapshot.data!);
            },
          )
        ],
      ),
    );
  }

  Stream<String> getLoadingMessages() {

    final messages = <String> [
      'Cargando películas',
      'Comprando palomitas de maíz',
      'Cargando populares',
      'Llamando a Lucila',
      'Ya mero...',
      'Esto está tardando más de lo esperado :(',
    ];

    return Stream.periodic(const Duration(milliseconds: 1200), (step) {
      return messages[step];
    }).take(messages.length);
  }
}