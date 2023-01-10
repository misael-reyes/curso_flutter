import 'package:flutter/material.dart';

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
            children: [
              // se recomienda usar el siguiente widget para formularios
              TextFormField(
                // esto es para ya tener el puntero sobre el textformfield
                autofocus: false,
                initialValue: '',
                // esto pone el teclado en mayúscula antes de cada palabra
                textCapitalization: TextCapitalization.words,
                // capturamos el evento cada que una tecla del teclado se precione
                onChanged: (value) {
                  print('value $value');
                },
                validator: (value) {
                  if (value == null) return 'Este campo es obligatorio';
                  return value.length < 3 ? 'Minimo tres' : null;
                },
                //autovalidateMode: AutovalidateMode.always,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                  hintText: 'Nombre del usuario',
                  labelText: 'Nombre',
                  helperText: 'Solo letras',
                  counterText: 'Tres caracteres',
                  prefixIcon: Icon(Icons.usb_rounded),
                  suffixIcon: Icon(Icons.group),
                  icon: Icon(Icons.admin_panel_settings),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
