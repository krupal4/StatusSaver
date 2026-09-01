import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:status_saver/src/theme/colors.dart';
import 'package:status_saver/src/theme/tokens.dart';

class Glass extends StatelessWidget {
  const Glass({
    super.key,
    required this.child,
    this.borderRadius,
    this.padding,
  });

  final Widget child;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final BorderRadius radius =
        borderRadius ?? BorderRadius.circular(AppRadii.lg);
    return RepaintBoundary(
      child: ClipRRect(
        borderRadius: radius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.glassFill,
              borderRadius: radius,
              border: Border.all(color: AppColors.glassStroke),
            ),
            child: padding == null
                ? child
                : Padding(padding: padding!, child: child),
          ),
        ),
      ),
    );
  }
}
