import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/routes/app_routes.dart';
import 'package:peliculas/theme/app_theme.dart';
import 'package:provider/provider.dart';

/// mandamos a llamar primero a AppState. Este widget es el primero que se va
/// a ejectuar, esto para que todos los widgets que se creen despues tengan
/// acceso a la misma instancia de MoviesProvider
void main() => runApp(const AppState());

/// aqui vamos a tener el estado del movies provider
/// ponemos en el main una instancia de MoviesProvider porque queremos
/// que sea global, es decir, toda la aplicacion debe de acceder a él
/// es por eso que lo debemos colocar en un punto bastante alto del árbol de 
/// widgeds
class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    // colocamos un multiprovider porque podemos tener más de un provaider
    return MultiProvider(
      providers: [
        /// cuando hacemso uso de los provider como se muestra a continuacion,
        /// (sin el lazy) 
        /// esto se hace de manera perezosa, es deicir, hasta que no venga
        /// un widget que lo quiera usar verifica si existe una instancia ya
        /// creada, sino la hay, crea una. Si queremos cambiar eso, solo basta
        /// con colocar en false el argumento lazy
        ChangeNotifierProvider(create: (_) => MoviesProvider(), lazy: false)
      ],
      // aqui colocamos el MyApp para que se ejeute nuestra app
      child: const MyApp(),
    );
  }
}

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
