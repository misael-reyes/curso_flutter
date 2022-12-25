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
          SizedBox(height: 15),
          CustomCardType2(
            imageUrl:
                'https://www.solofondos.com/wp-content/uploads/2015/04/Fondos-de-paisajes.jpg',
            nameImage: 'paisaje',
          ),
          SizedBox(height: 20),
          CustomCardType2(
            imageUrl:
                'https://i.pinimg.com/originals/21/0d/ac/210dac8eccff851d9cb23f5d2b0e0e02.jpg',
            nameImage: 'setup',
          ),
          SizedBox(height: 20),
          CustomCardType2(
              imageUrl:
                  'https://www.solofondos.com/wp-content/uploads/2015/04/Fondos-de-paisajes.jpg'),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}
