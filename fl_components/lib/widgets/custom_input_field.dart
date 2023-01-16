import 'package:flutter/material.dart';

class CustomImputField extends StatelessWidget {
  /// pondremos estas variables en el constructor para el usuario nos las pase si
  /// se requieren
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final String? counterTex;
  final IconData? suffixIcon;
  final IconData? icon;
  final TextInputType? textInputType;
  final bool isPassword;

  const CustomImputField(
      {Key? key,
      this.hintText,
      this.labelText,
      this.helperText,
      this.counterTex,
      this.suffixIcon,
      this.icon,
      this.textInputType,
      this.isPassword = false,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // esto es para ya tener el puntero sobre el textformfield
      autofocus: false,
      initialValue: '',
      // esto pone el teclado en mayúscula antes de cada palabra
      textCapitalization: TextCapitalization.words,
      // tipo de teclado para el campo
      keyboardType: textInputType,
      // ocultar el texto como la contraseña
      obscureText: isPassword,
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
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        counterText: counterTex,
        //prefixIcon: Icon(preffixIcon),
        suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
        icon: icon == null ? null : Icon(icon),

        /// ***** Esto se hace porque solo tenemos un input, si tenemos más se hace tedioso ***
        /// focusedBorder: OutlineInputBorder(
        ///   borderSide: BorderSide(
        ///     color: Colors.green,
        ///   ),
        /// ),
        /// border: OutlineInputBorder(
        ///   borderRadius: BorderRadius.only(
        ///     bottomLeft: Radius.circular(10),
        ///     topRight: Radius.circular(10),
        ///   ),
        /// ),
      ),
    );
  }
}
