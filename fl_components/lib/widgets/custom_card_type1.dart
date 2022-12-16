import '../theme/app_theme.dart';

import 'package:flutter/material.dart';

/// separamos el widged card para por si en un futuro tenemos que reutilizarlo
///
class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // colocamos un column porque queremos poner widget unos debajo de otros
      child: Column(
        children: [
          const ListTile(
            leading:
                Icon(Icons.account_box_rounded, color: AppTheme.colorPrimary),
            title: Text("soy el titulo"),
            subtitle: Text("yo soy el subtitulo"),
          ),
          Padding(
            //padding: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.only(right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => {},
                  child: const Text('Cancel'),
                  /// cambiamos el color del boton, pero si queremos aplicarles el mismo
                  /// tema a todos los textbutton, tenemos que definirlo en AppTheme.dart
                  //style: TextButton.styleFrom(primary: Colors.amber),
                ),
                TextButton(
                  onPressed: () => {},
                  child: const Text('Ok'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
