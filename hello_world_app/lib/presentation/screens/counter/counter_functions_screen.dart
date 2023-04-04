import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  // el constructor es const porque flutter lo maneja como inmutable (nunca va a cambiar)
  const CounterFunctionsScreen({super.key});

  // creación del estado
  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

// widget visual
class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter Functions'),
          centerTitle: true,
          // lo metimos dentro de un actions para que se pusiera a la derecha de la pantalla
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh_outlined),
              onPressed: () {
                clickCounter = 0;
                setState(() {});
              },
            ),
          ],
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
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            
            FloatingActionButton(
              shape: const StadiumBorder(), // cricular
              onPressed: () {
                clickCounter++;
                // indicamos que se tiene que renderizar nuestro widget
                setState(() {
                  // tambien podemos poner aqui la instrucción clickCounter ++;
                });
              },
              child: const Icon(Icons.plus_one),
            ),
            
            const SizedBox(height: 10),
            
            FloatingActionButton(
              shape: const StadiumBorder(), // circular
              onPressed: () {
                clickCounter--;
                // indicamos que se tiene que renderizar nuestro widget
                setState(() {
                  // tambien podemos poner aqui la instrucción clickCounter ++;
                });
              },
              child: const Icon(Icons.exposure_minus_1_outlined),
            ),
            
          ],
        ));
  }
}
