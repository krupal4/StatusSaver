import 'package:flutter/material.dart';
import 'package:status_saver/src/theme/motion.dart';

class CinemaPageRoute<T> extends PageRouteBuilder<T> {
  CinemaPageRoute({required WidgetBuilder builder})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) =>
              builder(context),
          transitionDuration: AppMotion.page,
          reverseTransitionDuration: AppMotion.page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final Animation<double> curved = CurvedAnimation(
              parent: animation,
              curve: AppMotion.emphasized,
              reverseCurve: AppMotion.standard,
            );
            return FadeTransition(
              opacity: curved,
              child: ScaleTransition(
                scale: Tween<double>(begin: 0.97, end: 1).animate(curved),
                child: child,
              ),
            );
          },
        );
}
