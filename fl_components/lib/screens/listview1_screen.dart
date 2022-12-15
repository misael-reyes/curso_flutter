import 'package:flutter/material.dart';

// es nuestro primer widged
class Listview1Screen extends StatelessWidget {
  const Listview1Screen({Key? key}) : super(key: key);

  // esto es una lista de string en dart
  final List<String> options = const [
    'Megaman',
    'Metal',
    'Gear',
    'Super Smash',
    'Final Fantasy'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List view tipo 1'),
      ),
      body: ListView(
        children: [
          ...options
              .map((game) => ListTile(
                    title: Text(game),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  ))
              .toList(),
        ],
      ),
    );
  }
}
