import 'package:flutter/material.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Widgets',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 3).getTheme(),
      // home: const HomeScreen(),
      // esta es la forma de navegar entre pantallas a traves de rutas
      // routes: {
      //   '/buttons':(context) => const ButtonsScreen(),
      //   '/cards': (context) => const CardsScreen()
      // },
    );
  }
}
