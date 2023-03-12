import 'package:flutter/material.dart';

class ScrollScreen extends StatelessWidget {
   
  const ScrollScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
         children: const [
          // Background
          Background(),
          MainContent()
         ],
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff30BAD6),
      height: double.infinity,
      alignment: Alignment.topCenter,
      child: const Image(image: AssetImage('assets/scroll-1.png'))
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const textStyle = TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white);

    // el SafeArea lo ponermos para quede abajo del menu del dispositivo donde viene la hora
    return SafeArea(
      bottom: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          const Text('11°', style: textStyle),
          const Text('Miércoles', style: textStyle),
          Expanded(child: Container()),
          const Icon(Icons.keyboard_arrow_down, size: 100, color: Colors.white),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}