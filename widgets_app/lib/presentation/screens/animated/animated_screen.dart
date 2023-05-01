import 'package:flutter/material.dart';

class AnimatedScreen extends StatelessWidget {
  
  static const name = 'animated_screen';
  
  const AnimatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //
        },
        child: const Icon(Icons.play_arrow_rounded),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          // curve es el tipo de animación que queremos aplicar
          curve: Curves.easeOutCubic,
          width: 140,
          height: 400,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(20)
          )
        ),
      )
    );
  }
}