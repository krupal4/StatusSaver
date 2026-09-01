import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:status_saver/src/theme/motion.dart';
import 'package:status_saver/src/theme/tokens.dart';

class ShimmerGrid extends StatelessWidget {
  const ShimmerGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    return MasonryGridView.count(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md,
        AppSpacing.xs,
        AppSpacing.md,
        120,
      ),
      crossAxisCount: 2,
      mainAxisSpacing: AppSpacing.xs,
      crossAxisSpacing: AppSpacing.xs,
      itemCount: 6,
      itemBuilder: (context, index) {
        return StatusTileShimmer(
          height: index.isEven ? 220 : 168,
          color: colors.surfaceContainerHighest,
          highlight: colors.surface,
        );
      },
    );
  }
}

class StatusTileShimmer extends StatelessWidget {
  const StatusTileShimmer({
    super.key,
    this.height = 180,
    this.color,
    this.highlight,
  });

  final double height;
  final Color? color;
  final Color? highlight;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: color ?? colors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(AppRadii.md),
      ),
    )
        .animate(onPlay: (controller) => controller.repeat())
        .shimmer(
          duration: AppMotion.shimmer,
          color: highlight ?? colors.surface,
        );
  }
}
