import 'package:flutter/material.dart';
import 'package:status_saver/src/theme/colors.dart';

class BrandIcon extends StatelessWidget {
  const BrandIcon({super.key, this.size = 48});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size * 0.28),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.emerald, AppColors.emeraldDim],
        ),
      ),
      child: Icon(
        Icons.auto_awesome_mosaic_rounded,
        color: Colors.white,
        size: size * 0.52,
      ),
    );
  }
}
