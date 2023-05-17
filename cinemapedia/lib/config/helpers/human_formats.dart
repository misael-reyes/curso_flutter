
import 'package:intl/intl.dart';

/// Usamos el paquete de untl para dar formato
/// ¿Por qué creamos una clase para esto?
/// se crea una clase porque si el día de mañana decidimo
/// cambiar de paquete para hacer el formateo, no tendriamo que
/// modificar en todos los lugares donde usamos dicho paquete, solo 
/// se tendría que modificar esta clase

class HumanFormats {

  static String number( double number ) {

    return NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
      locale: 'en'
    ).format(number);

  }

}