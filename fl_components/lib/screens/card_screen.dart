import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card Widget"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          // card widget, son parecidas a los item del recycler view
          Card(
            // colocamos un column porque queremos poner widget unos debajo de otros
            child: Column(
              children: const [
                ListTile(
                  leading: Icon(Icons.account_box_rounded,
                      color: AppTheme.colorPrimary),
                  title: Text("soy el titulo"),
                  subtitle: Text("yo soy el subtitulo"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
