import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider & Checks'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // lo dejamos con .adaptative para dependiendo de ios o android, se muestre diferente
            Slider.adaptive(
                min: 50,
                max: 400,
                activeColor: AppTheme.colorPrimary,
                value: _sliderValue,
                //divisions: 5,
                onChanged: (value) {
                  _sliderValue = value;
                  // llamamos a setState para redibujar nuestro widget
                  setState(() {
                    // esta es otra forma de hacerlo, dentro de la función
                    // _sliderValue = value;
                  });
                }
            ),
      
            Image(
              image: const NetworkImage('https://3.bp.blogspot.com/-d-vAC9IhZZ0/W9tsPBd9SMI/AAAAAAAAXyQ/LjTBWyUigNkUEuWNbBqpnb8Ivw3FCSUHQCLcBGAs/s640/batman%2Bacabado.png'),
              fit: BoxFit.contain,
              width: _sliderValue,
            )
          ],
        ),
      ),
    );
  }
}
