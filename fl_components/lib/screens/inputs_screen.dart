import 'package:flutter/material.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs y Forms'),
      ),

      /// usaremos uno de los widget que nos permira hacer scrool, pero con un solo hijo
      /// es uno de los más utilizados
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              // se recomienda usar el siguiente widget para formularios
              TextFormField(
                autofocus: true,
                initialValue: 'Misael Reyes',
                // esto pone el teclado en mayúscula antes de cada palabra
                textCapitalization: TextCapitalization.words,
                // capturamos el evento cada que una tecla del teclado se precione
                onChanged: (value) {
                  print('value $value');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
