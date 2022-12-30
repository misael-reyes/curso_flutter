import 'dart:math';

import 'package:flutter/material.dart';

/// para la animación, es necesario usar un StatefulWidget
/// ya que el widget container estará cambiando sus valores
/// usaremos ContainerAnimated Widget
class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  // propiedades para el contenedor que cambiaran

  // al colocar _ decimos que son private
  double _width = 50;
  double _height = 50;
  Color _color = Colors.orange;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(10);

  void changeShape() {
    final random = Random();

    _width = random.nextInt(300).toDouble() + 70;
    _height = random.nextInt(300).toDouble() + 70;
    _color = Color.fromRGBO(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      1,
    );
    _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble() + 10);

    // debemos usar setstate aunque no sea necesario colocar nada dentro de el
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
        child: Container(
          // no puedo tener color y decoraton al mismo tiempo, tiene que ser solo uno
          //color: Colors.red,
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: () => changeShape(),
        onPressed: changeShape,
        child: const Icon(
          Icons.play_arrow,
          size: 30,
        ),
      ),
    );
  }
}
