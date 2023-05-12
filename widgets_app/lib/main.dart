import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

void main() {
  runApp(
    // esto se tiene que hacer si se usa Flutter Riverpod
    const ProviderScope(
      child: MainApp()
    )
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final int selectColor = ref.watch(selectedColorProvider);
    final bool isDarkmode = ref.watch(isDarkmodeProvider);

    return MaterialApp.router(
      title: 'Flutter Widgets',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: selectColor, isDarkMode: isDarkmode).getTheme(),
      // home: const HomeScreen(),
      // esta es la forma de navegar entre pantallas a traves de rutas
      // routes: {
      //   '/buttons':(context) => const ButtonsScreen(),
      //   '/cards': (context) => const CardsScreen()
      // },
    );
  }
}
