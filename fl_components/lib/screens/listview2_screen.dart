import 'package:flutter/material.dart';

// es nuestro primer widged
class Listview2Screen extends StatelessWidget {
  const Listview2Screen({Key? key}) : super(key: key);

  // esto es una lista de string en dart
  final List<String> options = const [
    'Megaman',
    'Metal',
    'Gear',
    'Super Smash',
    'Final Fantasy',
    'Megaman',
    'Metal',
    'Gear',
    'Super Smash',
    'Megaman',
    'Metal',
    'Gear',
    'Super Smash',
    'Megaman',
    'Metal',
    'Gear',
    'Super Smash',
    'Megaman',
    'Metal',
    'Gear',
    'Super Smash',
    'Megaman',
    'Metal',
    'Gear',
    'Super Smash'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('List view tipo 2'),
          //elevation: 0,
          //backgroundColor: Colors.indigo,
        ),
        // vamos a usar un constructor con nombre de listview para el separador
        body: ListView.separated(
            itemBuilder: (context, index) => ListTile(
                  title: Text(options[index]),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.indigo,
                  ),
                  onTap: (() {
                    final game = options[index];
                    print(game);
                  }),
                ),
            // al usar los _ es como dar nombre a esa variable que no usamos
            separatorBuilder: (_, __) => const Divider(),
            itemCount: options.length));
  }
}
