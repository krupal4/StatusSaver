import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:status_saver/src/common/helpers/statuses_helper.dart';
import 'package:status_saver/src/statuses/views/image_tile.dart';
import 'package:status_saver/src/statuses/views/video_tile.dart';
import 'package:status_saver/src/theme/motion.dart';
import 'package:status_saver/src/theme/tokens.dart';

class StatusesGridWidget extends StatelessWidget {
  const StatusesGridWidget({
    super.key,
    required this.scrollController,
    required this.statuses,
    required this.showQuickSave,
  });
  final List<String> statuses;
  final ScrollController scrollController;
  final bool showQuickSave;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      controller: scrollController,
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md,
        AppSpacing.xs,
        AppSpacing.md,
        120,
      ),
      crossAxisCount: 2,
      mainAxisSpacing: AppSpacing.xs,
      crossAxisSpacing: AppSpacing.xs,
      itemCount: statuses.length,
      addAutomaticKeepAlives: false,
      itemBuilder: (context, index) {
        final String statusPath = statuses[index];
        Widget tile = RepaintBoundary(
          child: isImageStatus(statusPath)
              ? ImageTile(
                  imagePath: statusPath,
                  showQuickSave: showQuickSave,
                )
              : VideoTile(
                  videoPath: statusPath,
                  showQuickSave: showQuickSave,
                ),
        );
        if (index < 8) {
          tile = tile
              .animate()
              .fadeIn(
                duration: AppMotion.page,
                delay: Duration(milliseconds: 30 * index),
                curve: AppMotion.emphasized,
              )
              .moveY(
                begin: 10,
                end: 0,
                duration: AppMotion.page,
                delay: Duration(milliseconds: 30 * index),
                curve: AppMotion.emphasized,
              );
        }
        return KeyedSubtree(key: ValueKey(statusPath), child: tile);
      },
    );
  }
}
