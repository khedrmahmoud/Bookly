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

  static Page scaleTransitionPage(context, state, Widget route) {
    return CustomTransitionPage<void>(
        key: state.pageKey,
        child: route,
        transitionDuration: const Duration(milliseconds: 3000),
        reverseTransitionDuration: const Duration(milliseconds: 200),
        transitionsBuilder: (context, animation, anotherAnimation, child) {
          animation = CurvedAnimation(
              curve: Curves.fastLinearToSlowEaseIn,
              parent: animation,
              reverseCurve: Curves.fastOutSlowIn);
          return ScaleTransition(
            alignment: Alignment.center,
            scale: animation,
            child: child,
          );
        });
  }

  static Page sizeTransitionPage(context, state, Widget route) {
    return CustomTransitionPage<void>(
        key: state.pageKey,
        child: route,
        transitionDuration: const Duration(milliseconds: 1500),
        reverseTransitionDuration: const Duration(milliseconds: 200),
        transitionsBuilder: (context, animation, anotherAnimation, child) {
          animation = CurvedAnimation(
              curve: Curves.fastLinearToSlowEaseIn,
              parent: animation,
              reverseCurve: Curves.fastOutSlowIn);
          return ScaleTransition(
            alignment: Alignment.centerLeft,
            scale: animation,
            child: child,
          );
        });
  }
}
