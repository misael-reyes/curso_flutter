/// Seguiremos usando go_router para la navegación en
/// nuestra aplicación, esto es porque con GoRouter no necesitariamos
/// configurar muchas cosas si el día de mañana decidamos pasar
/// nuestro proyecto a la web

import 'package:cinemapedia/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    )
  ]
);