
import 'package:intl/intl.dart';

/// Usamos el paquete de untl para dar formato
/// ¿Por qué creamos una clase para esto?
/// se crea una clase porque si el día de mañana decidimo
/// cambiar de paquete para hacer el formateo, no tendriamo que
/// modificar en todos los lugares donde usamos dicho paquete, solo 
/// se tendría que modificar esta clase

class HumanFormats {

  static String number({ 
    required double number, 
    int decimals = 0 
  }) {

    return NumberFormat.compactCurrency(
      decimalDigits: decimals,
      symbol: '',
      locale: 'en'
    ).format(number);

  }

}