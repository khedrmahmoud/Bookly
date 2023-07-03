import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class FadeRoute {
  static Page fadeTransitionPage(context, state, route) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: route,
      transitionDuration: const Duration(milliseconds: 1200),
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) =>
          FadeTransition(
        opacity: animation,
        child: route,
      ),
    );
  }
}
