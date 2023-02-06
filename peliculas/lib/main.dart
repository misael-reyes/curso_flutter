import 'package:flutter/material.dart';
import 'package:peliculas/routes/app_routes.dart';
import 'package:peliculas/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Películas',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
      theme: AppTheme.ligthTheme,
    );
  }
}