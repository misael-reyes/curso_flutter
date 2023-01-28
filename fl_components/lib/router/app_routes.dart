import 'package:fl_components/models/models.dart';
import 'package:flutter/material.dart';

import 'package:fl_components/screens/screens.dart';
import 'package:flutter/rendering.dart';

/// esto no es un widgeds, sino una clase donde definiremos
/// nuestras rutas
/// Esto nos va a servir cuando tengamos muchas rutas hacia vistas
/// nos permitira terner más organizado nuestro código

class AppRoutes {
  // ruta inicial

  static const initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    // MenuOption(
    //     route: 'home',
    //     name: 'Home Screen',
    //     screen: const HomeScreen(),
    //     icon: Icons.accessible_forward_outlined),
    MenuOption(
        route: 'listview1',
        name: 'List View 1',
        screen: const Listview1Screen(),
        icon: Icons.ac_unit_sharp),
    MenuOption(
        route: 'listview2',
        name: 'List View 2',
        screen: const Listview2Screen(),
        icon: Icons.access_alarms_outlined),
    MenuOption(
        route: 'alert',
        name: 'Alert Screen',
        screen: const AlertScreen(),
        icon: Icons.accessibility_new),
    MenuOption(
        route: 'card',
        name: 'Card Screen',
        screen: const CardScreen(),
        icon: Icons.account_balance_rounded),
    MenuOption(
        route: 'avatar',
        icon: Icons.supervised_user_circle_outlined,
        name: 'Avatar Screen',
        screen: const AvatarScreen()),
    MenuOption(
        route: 'animated',
        icon: Icons.play_circle_outline,
        name: 'Animated Screen',
        screen: const AnimatedScreen()),
    MenuOption(
        route: 'inputs',
        icon: Icons.input_outlined,
        name: 'Inputs Screen',
        screen: const InputsScreen()),
    MenuOption(
        route: 'slider',
        icon: Icons.account_tree_sharp,
        name: 'Slider Screen',
        screen: const SliderScreen())
  ];

  // las demás rutas

  /// este mapa esta bien, pero al final no lo vamos a usar porque usaremos el menuOptions
  // static Map<String, Widget Function(BuildContext)> routes = {
  //   'home': (BuildContext context) => const HomeScreen(),
  //   'listview1': (BuildContext context) => const Listview1Screen(),
  //   'listview2': (BuildContext context) => const Listview2Screen(),
  //   'alert': (BuildContext context) => const AlertScreen(),
  //   'card': (BuildContext context) => const CardScreen(),
  // };

  // creamos las rutas dinámicas

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    /// esto es para cuando colocamos rutas que no estan definidas, se crean de manera
    /// dinamica, por ejemplo, si en la vista home_screen especificamos que queremos
    /// navegar a la ruta xx que sabemos que no esta definida en la seccion de routes,
    /// la ruta xx se creara de manera dinamica navegandonos a la vista que especifiquemos
    return MaterialPageRoute(
      builder: (context) => const AlertScreen(),
    );
  }

  // función para acceder a las rutas de nuestra app
  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {}; // objeto vacio

    appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});
    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }
}
