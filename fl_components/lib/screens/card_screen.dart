import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

/// aquí lo importante es que si queremos reutilizar un widget como es
/// este caso, es mejor tener el widget en una sola clase para que
/// despues lo podamos usar en cualquier momento

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card Widget"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: const [
          // card widget, son parecidas a los item del recycler view
          CustomCardType1(),
          // ponemos una separación
          SizedBox(height: 10),
          CustomCardType2()
        ],
      ),
    );
  }
}
