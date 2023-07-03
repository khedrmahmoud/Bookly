import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class TransitionRoute {
  static Page fadeTransitionPage(context, state, Widget route) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: route,
      transitionDuration: const Duration(milliseconds: 1100),
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
