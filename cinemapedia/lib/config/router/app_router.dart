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

    // mantenemos el estado
    StatefulShellRoute.indexedStack(

      builder: (context, state, navigationShell) => HomeScreen(childView: navigationShell),
      
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const HomeView(),
              // daughter routes ( rutas hijas )
              routes: [
                GoRoute(
                  path: 'movie/:id',
                  name: MovieScreen.name,
                  builder: (context, state) {
                    // obtenemos el id que nos mandan en el path
                    final movieId = state.pathParameters['id'] ?? 'no-id';
                    return MovieScreen(movieId: movieId);
                  }
                )
              ],
            )
          ]
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/favorites',
              builder: (context, state) => const FavoritesView()
            )
          ]
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/favorites',
              builder: (context, state) => const FavoritesView()
            )
          ]
        )
      ]
    )

    // nested navigation
    /// this is for ButtonNavigationBar
    
    // usabamos shellroute antes de la version 7.0.1, pero ya podeos mantener el esado
    // ShellRoute(
    //   // el builder es algo que se llama en tiempo de ejecución para construir algo
    //   builder: (context, state, child) => HomeScreen(childView: child),
    //   routes: [
    //     GoRoute(
    //       path: '/',
    //       builder: (context, state) => const HomeView(),
    //       // daughter routes ( rutas hijas )
    //       routes: [
    //         GoRoute(
    //           path: 'movie/:id',
    //           name: MovieScreen.name,
    //           builder: (context, state) {
    //             // obtenemos el id que nos mandan en el path
    //             final movieId = state.pathParameters['id'] ?? 'no-id';
    //             return MovieScreen(movieId: movieId);
    //           },
    //         )
    //       ]
    //     ),

    //     GoRoute(
    //       path: '/favorites',
    //       builder: (context, state) => const FavoritesView()
    //     )
    //   ]
    // )


    /// podemos poner otras rutas fuera del shellroute, pero se saldrian, es decir,
    /// en el shellroute nosotros pondremos el buttonnavigationbar, eso quiere decir
    /// que en todas las rutas que esten dentro del shell aparecera el buttonnavigation,
    /// si hay otra ruta fuera, el buttonnavigation ya no aparecera
    


    // father/daughter routes (rutas padre/hijas)

    //GoRoute(
    //  path: '/',
    //  name: HomeScreen.name,
    //  builder: (context, state) => const HomeScreen( childView: FavoritesView() ),
    //
    //  // esto lo hacemos para que funcione bien en el navegador web
    //  routes: [
    //    GoRoute(
    //      path: 'movie/:id',
    //      name: MovieScreen.name,
    //      builder: (context, state) {
    //        // obtenemos el id que nos mandan en el path
    //        final movieId = state.pathParameters['id'] ?? 'no-id';
    //        return MovieScreen(movieId: movieId);
    //      },
    //    )
    //  ]
    //),
  ]
);