import 'package:flutter/material.dart';
import 'package:status_saver/src/theme/tokens.dart';

class StatusMediaCard extends StatelessWidget {
  const StatusMediaCard({
    super.key,
    required this.statusPath,
    required this.media,
    required this.onOpen,
    this.badge,
    this.overlay,
  });

  final String statusPath;
  final Widget media;
  final VoidCallback onOpen;
  final Widget? badge;
  final Widget? overlay;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      borderRadius: BorderRadius.circular(AppRadii.md),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onOpen,
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            Hero(
              tag: statusPath,
              child: media,
            ),
            const Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0x33000000),
                      Color(0x00000000),
                      Color(0x66000000),
                    ],
                    stops: [0, 0.45, 1],
                  ),
                ),
              ),
            ),
            if (badge != null) Center(child: badge),
            if (overlay != null)
              Positioned(
                top: AppSpacing.xs,
                right: AppSpacing.xs,
                child: overlay!,
              ),
          ],
        ),
      ),
    );
  }
}
