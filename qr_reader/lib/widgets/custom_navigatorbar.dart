import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {

  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // este elemento nos dira cual es el item seleccioado
      currentIndex: 0,
      elevation: 0,
      items: const <BottomNavigationBarItem>[
        // tenemos que poner por lo menos dos items
        BottomNavigationBarItem(
          label: 'Mapa',
          icon: Icon(Icons.map)
        ),
        BottomNavigationBarItem(
          label: 'Direcciones',
          icon: Icon(Icons.compass_calibration)
        )
      ],
    );
  }
}