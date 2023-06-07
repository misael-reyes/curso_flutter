
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationbar extends StatelessWidget {

  final StatefulNavigationShell currentChild;
  
  const CustomBottomNavigationbar({super.key, required this.currentChild});

  @override
  Widget build(BuildContext context) {
    
    return BottomNavigationBar(
      elevation: 0,
      // currentIndex: getCurrentIndex( context ),
      currentIndex: currentChild.currentIndex,
      // value is the index value of the selected option
      // onTap: (value) => onItemTapped(context, value),
      onTap: (value) => currentChild.goBranch(value),
      // un BottomNavigationBar siempre ocupara minimo dos hijos, con uno marca error
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max),
          label: 'Inicio'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.label_outline),
          label: 'Categorías'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'Favoritos'
        )
      ],
    );
  }
}