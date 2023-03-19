import 'package:flutter/material.dart';
import 'package:qr_reader/pages/pages.dart';
import 'package:qr_reader/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.delete_forever)
          )
        ],
      ),
      body: const _HomePageBody(),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {

  const _HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {

    int currentIndex = 0;

    switch(currentIndex) {
      case 0:
        return const MapasPage();

      case 1:
        return const DireccionesPage();
      
      default:
        return const MapasPage();
    }
  }
}
