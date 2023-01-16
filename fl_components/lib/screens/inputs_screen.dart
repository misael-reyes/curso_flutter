import 'package:flutter/material.dart';
import 'package:fl_components/widgets/widgets.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs y Forms'),
      ),

      /// usaremos uno de los widget que nos permira hacer scrool, pero con un solo hijo
      /// es uno de los más utilizados
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: const [
              /// como vamos a usar varios TextFormField, es mejor crear nuestro
              /// propio Widget para poder personalizarlo de la misma maneras que
              /// el resto
              CustomImputField(
                  labelText: 'Nombre', hintText: 'Nombre de usuario'),
              SizedBox(height: 30),

              CustomImputField(
                  labelText: 'Apellido', hintText: 'Apellido de usuario'),
              SizedBox(height: 30),

              CustomImputField(
                  labelText: 'Correo',
                  hintText: 'Correo del usuario',
                  textInputType: TextInputType.emailAddress),
              SizedBox(height: 30),

              CustomImputField(
                  labelText: 'Contraseña',
                  hintText: 'Contraseña del usuario',
                  isPassword: true),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
