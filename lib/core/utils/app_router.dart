import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:bookly/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

import 'fade_route_transition.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        // builder: (context, state) => FadeRoute(route: const HomeView()).route,
        pageBuilder: (context, state) =>
            FadeRoute.fadeTransitionPage(context, state, const HomeView()),
      ),
    ],
  );
}
