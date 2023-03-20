
import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  
  int _selectedMenuOpt = 1;

  int get selectedMenuOpt {
    return _selectedMenuOpt;
  }

  set selectedMenuOpt( int i ) {
    _selectedMenuOpt = i;
    /// tenemos que notificar a cualquier widget que este escuchando
    /// que el selectedMenuOpt cambio su valor
    notifyListeners();
  }
}