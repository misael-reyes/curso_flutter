import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  // el constructor es const porque flutter lo maneja como inmutable (nunca va a cambiar)
  const CounterScreen({super.key});

  // creación del estado
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

// widget visual
class _CounterScreenState extends State<CounterScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$clickCounter',
            style: const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
          ),
          Text(
            // clickCounter == 1 ? 'Click' : 'Clicks',
            'Click${clickCounter == 1 ? '' : 's'}',
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w100),
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          clickCounter++;
          // indicamos que se tiene que renderizar nuestro widget
          setState(() {
            // tambien podemos poner aqui la instrucción clickCounter ++;
          });
        },
        child: const Icon(Icons.plus_one),
      ),
    );
  }
}
