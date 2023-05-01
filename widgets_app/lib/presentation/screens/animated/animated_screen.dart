import 'package:flutter/material.dart';
import 'dart:math' show Random;

class AnimatedScreen extends StatefulWidget {
  
  static const name = 'animated_screen';
  
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  
  // propiedades que queremos animar
  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10.0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      floatingActionButton: FloatingActionButton(
        /// se puede hacer la llamada a la función changeShape de dos
        /// formas porque el número de argumentos de la función
        /// onPressed es el mismo que el núemro de argumentos de la
        /// función changeShape
        // onPressed: ()=> changeShape(),
        onPressed: changeShape,
        child: const Icon(Icons.play_arrow_rounded),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          // curve es el tipo de animación que queremos aplicar
          curve: Curves.elasticOut,
          width: width <= 0 ? 0 : width,
          height: height <= 0 ? 0 : height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius < 0 ? 0 : borderRadius)
          )
        ),
      )
    );
  }
  
  void changeShape() {
    final random = Random();
    
    width = random.nextInt(300) + 120;
    height = random.nextInt(300) + 120;
    borderRadius = random.nextInt(100) + 20;
    
    color = Color.fromRGBO(
      random.nextInt(255), // red
      random.nextInt(255), // green
      random.nextInt(255), // blue
      1 // opacity
    );
    
    setState(() {});
  }
}