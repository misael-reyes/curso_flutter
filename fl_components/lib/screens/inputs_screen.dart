import 'package:flutter/material.dart';
import 'package:fl_components/widgets/widgets.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // esto es para guardar los estados del formulario
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'first_name': 'Misael',
      'last_name': 'Reyes',
      'email': 'misael@gmail.com',
      'password': 'misael',
      'role': 'Admin',
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs y Forms'),
      ),

      /// usaremos uno de los widget que nos permira hacer scrool, pero con un solo hijo
      /// es uno de los más utilizados
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: myFormKey,
            child: Column(
              children: [
                /// como vamos a usar varios TextFormField, es mejor crear nuestro
                /// propio Widget para poder personalizarlo de la misma maneras que
                /// el resto
                const CustomImputField(
                    labelText: 'Nombre', hintText: 'Nombre de usuario'),
                const SizedBox(height: 30),

                const CustomImputField(
                    labelText: 'Apellido', hintText: 'Apellido de usuario'),
                const SizedBox(height: 30),

                const CustomImputField(
                    labelText: 'Correo',
                    hintText: 'Correo del usuario',
                    textInputType: TextInputType.emailAddress),
                const SizedBox(height: 30),

                const CustomImputField(
                    labelText: 'Contraseña',
                    hintText: 'Contraseña del usuario',
                    isPassword: true),
                const SizedBox(height: 30),

                ElevatedButton(
                  onPressed: () {
                    if (!myFormKey.currentState!.validate()) {
                      // esto no es valido
                      print('el fomulario no es valido');
                      return;
                    }

                    // de mientras ocultamos el teclado
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(child: Text('Guardar')),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
