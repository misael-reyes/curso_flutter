import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  // variables

  double _sliderValue = 100;
  bool _sliderEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider & Checks'),
      ),
      body: Column(
        children: [
          // lo dejamos con .adaptative para dependiendo de ios o android, se muestre diferente
          Slider.adaptive(
              min: 50,
              max: 400,
              activeColor: AppTheme.colorPrimary,
              value: _sliderValue,
              //divisions: 5,
              onChanged: _sliderEnabled
                  ? (value) {
                      _sliderValue = value;
                      // llamamos a setState para redibujar nuestro widget
                      setState(() {
                        // esta es otra forma de hacerlo, dentro de la función
                        // _sliderValue = value;
                      });
                    }
                  : null),

          // pocos usan el checbox porque se ve feo, en su lugar usan checkboxlisttitle
          Checkbox(
              value: _sliderEnabled,
              onChanged: (value) => setState(() {
                    _sliderEnabled = value ?? true;
                  })),

          CheckboxListTile(
              title: const Text('Habilitar Slider'),
              activeColor: AppTheme.colorPrimary,
              value: _sliderEnabled,
              onChanged: (value) {
                _sliderEnabled = value ?? true;
                setState(() {});
              }),

          Switch(
              value: _sliderEnabled,
              onChanged: (value) => setState(() { _sliderEnabled = value; })
          ),

          SwitchListTile(
            title: const Text('Habilitar Slider'),
            activeColor: AppTheme.colorPrimary,
            value: _sliderEnabled, 
            onChanged: (value) => setState(() {
              _sliderEnabled = value;
            })
          ),

          // con esto se muestran todas las licencias que nuestra aplicacion esta usando
          const AboutListTile(),

          /// lo envolvemos dentro de un expanded para indicar que tome todo
          /// el ancho posible ese widget
          Expanded(
            child: SingleChildScrollView(
              child: Image(
                image: const NetworkImage(
                    'https://3.bp.blogspot.com/-d-vAC9IhZZ0/W9tsPBd9SMI/AAAAAAAAXyQ/LjTBWyUigNkUEuWNbBqpnb8Ivw3FCSUHQCLcBGAs/s640/batman%2Bacabado.png'),
                fit: BoxFit.contain,
                width: _sliderValue,
              ),
            ),
          )
        ],
      ),
    );
  }
}
