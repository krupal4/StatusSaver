import 'package:flutter/animation.dart';

class AppMotion {
  static const Duration micro = Duration(milliseconds: 180);
  static const Duration page = Duration(milliseconds: 280);
  static const Duration hero = Duration(milliseconds: 400);
  static const Duration shimmer = Duration(milliseconds: 1200);

  static const Curve emphasized = Curves.easeOutCubic;
  static const Curve standard = Curves.easeInOutCubic;
}
