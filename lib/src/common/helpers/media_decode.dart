import 'package:flutter/widgets.dart';
import 'package:status_saver/src/theme/tokens.dart';

int gridImageCacheWidth(BuildContext context) {
  final MediaQueryData media = MediaQuery.of(context);
  final double tileWidth =
      (media.size.width - (AppSpacing.md * 2) - AppSpacing.xs) / 2;
  return (tileWidth * media.devicePixelRatio).round().clamp(120, 720);
}
