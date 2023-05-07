import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        // value es el indice que seleccionamos del menu
        setState(() {
          navDrawerIndex = value;
        });
      },
      children: const [

        NavigationDrawerDestination(
          icon: Icon(Icons.file_download), 
          label: Text('download')
        ),

        NavigationDrawerDestination(
          icon: Icon(Icons.hail_rounded), 
          label: Text('otra opcion')
        )

      ]
    );
  }
}