import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  const CardTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: const [
        // todos los table rows que pongamos deben de tener la misma cantidad de hijos
        TableRow(
          children: [
            _SigleCard(icon: Icons.ac_unit_rounded, color: Colors.blueAccent, label: 'General'), 
            _SigleCard(icon: Icons.access_time_outlined, color: Colors.purple, label: 'Transport')
          ]
        ),
        TableRow(children: [
          _SigleCard(icon: Icons.agriculture, color: Colors.pink, label: 'Shoping'),
          _SigleCard(icon: Icons.account_tree, color: Colors.orange, label:'Bills')
        ]),
        TableRow(children: [
          _SigleCard(icon: Icons.catching_pokemon_sharp, color: Colors.blue, label: 'Entertainment'),
          _SigleCard(icon: Icons.badge_outlined, color: Colors.green, label: 'Grocery')
        ]),
        TableRow(children: [
          _SigleCard(icon: Icons.catching_pokemon_sharp, color: Colors.blue, label: 'Entertainment'),
          _SigleCard(icon: Icons.badge_outlined, color: Colors.green, label: 'Grocery')
        ])
      ],
    );
  }
}

// widget que serán los botones

class _SigleCard extends StatelessWidget {

  // atributos que tendran que pasarnos para crear este widget
  final IconData icon;
  final Color color;
  final String label;

  const _SigleCard({
    super.key,
    required this.icon,
    required this.color,
    required this.label
  });

  @override
  Widget build(BuildContext context) {

    var boxDecoration = BoxDecoration(
      color: const Color.fromRGBO(62, 66, 107, 0.7),
      borderRadius: BorderRadius.circular(20)
    );

    return Container(
      margin: const EdgeInsets.all(5),
      // este widget corta todo lo que salga de su espacio
      child: ClipRRect (
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 180,
            decoration: boxDecoration,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: color,
                  radius: 30,
                  child: Icon(icon, size: 35, color: Colors.white),
                ),
                const SizedBox(height: 20),
                Text(label, style: TextStyle(color: color, fontSize: 16))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
