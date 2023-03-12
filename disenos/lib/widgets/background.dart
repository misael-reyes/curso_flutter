import 'dart:math';

import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  // Propiedades
  final boxDecoration = const BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.2, 0.8],
          colors: [
            Color(0xff2E305F), 
            Color(0xff202333)
          ]
      )
  );

  // Constructor
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // gradiente
        Container(decoration: boxDecoration),
        // caja rosada
        const Positioned(
          top: -100,
          left: -30,
          child: _PinBox()
        )
      ],
    );
  }
}

class _PinBox extends StatelessWidget {
  const _PinBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        width: 360,
        height: 360,
        //color: Colors.pink
        decoration: BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.circular(80),
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(236, 98, 188, 1),
              Color.fromRGBO(241, 142, 172, 1)
            ]
          )
        ),
      ),
    );
  }
}
