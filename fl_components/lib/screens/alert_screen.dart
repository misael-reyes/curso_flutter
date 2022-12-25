import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          // si este boton es especial, podemos sobreescribir su estilo
          // lo dejo comentado como referencia
          // style: ElevatedButton.styleFrom(
          //   backgroundColor: Colors.indigo,
          //   elevation: 50,
          // ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Text(
              'Mostrar alerta',
              style: TextStyle(fontSize: 18),
            ),
          ),
          onPressed: () {
            //
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.close),
        onPressed: () {
          // pop lo que hace es botar la última pantalla que está en el stack de cartas
          // entonces lo que hará será enviarnos a la pantalla anterior
          Navigator.pop(context);
        },
      ),
    );
  }
}
