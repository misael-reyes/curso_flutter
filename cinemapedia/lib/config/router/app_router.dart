/// Seguiremos usando go_router para la navegación en
/// nuestra aplicación, esto es porque con GoRouter no necesitariamos
/// configurar muchas cosas si el día de mañana decidamos pasar
/// nuestro proyecto a la web

import 'package:cinemapedia/presentation/screens/screens.dart';
import 'package:cinemapedia/presentation/views/views.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen( childView: FavoritesView() ),

      // esto lo hacemos para que funcione bien en el navegador web
      routes: [
        GoRoute(
          path: 'movie/:id',
          name: MovieScreen.name,
          builder: (context, state) {
            // obtenemos el id que nos mandan en el path
            final movieId = state.pathParameters['id'] ?? 'no-id';
            return MovieScreen(movieId: movieId);
          },
        )
      ]
    ),
  ]
);