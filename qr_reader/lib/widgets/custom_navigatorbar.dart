import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {

  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
      // llamamos al set selectedMenuOpt
      onTap: (int indice) => uiProvider.selectedMenuOpt = indice,
      // este elemento nos dira cual es el item seleccioado
      currentIndex: currentIndex,
      elevation: 0,
      items: const <BottomNavigationBarItem>[
        // tenemos que poner por lo menos dos items
        BottomNavigationBarItem(label: 'Mapa', icon: Icon(Icons.map)),
        BottomNavigationBarItem(label: 'Direcciones', icon: Icon(Icons.compass_calibration))
      ],
    );
  }
}
