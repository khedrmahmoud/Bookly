import 'package:bookly/features/home/presentation/views/book_details_view.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:bookly/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

import 'fade_route_transition.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        pageBuilder: (context, state) =>
            FadeRoute.fadeTransitionPage(context, state, const HomeView()),
      ),
      GoRoute(
        path: kBookDetailsView,
        pageBuilder: (context, state) => FadeRoute.fadeTransitionPage(
            context, state, const BookDetailsView()),
      ),
    ],
  );
}
