
import 'package:intl/intl.dart';

class HumanFormats {
  
  static String humanReadbleNumber(double number) {
    // para trabajar con formatos, trabajaremos con el paquete intl
    
    final formatterNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: ''
    ).format(number);
    
    return formatterNumber;
  }
}