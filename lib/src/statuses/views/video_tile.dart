import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:status_saver/src/common/helpers/cinema_route.dart';
import 'package:status_saver/src/common/helpers/statuses_helper.dart';
import 'package:status_saver/src/common/views/shimmer_grid.dart';
import 'package:status_saver/src/statuses/notifiers/statuses_notifier.dart';
import 'package:status_saver/src/statuses/notifiers/video_thumbnail_provider.dart';
import 'package:status_saver/src/statuses/views/quick_save_button.dart';
import 'package:status_saver/src/statuses/views/status_media_card.dart';
import 'package:status_saver/src/statuses/views/video_view.dart';
import 'package:status_saver/src/theme/colors.dart';

class VideoTile extends ConsumerWidget {
  const VideoTile({
    super.key,
    required this.videoPath,
    this.showQuickSave = false,
  });

  final String videoPath;
  final bool showQuickSave;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool alreadySaved = ref.watch(savedStatusFilenamesProvider).contains(
          videoPath.split('/').last,
        );
    final thumbnail = ref.watch(videoThumbnailProvider(videoPath));

    return thumbnail.when(
      loading: () => const StatusTileShimmer(),
      error: (_, __) => StatusMediaCard(
        statusPath: videoPath,
        onOpen: () => _open(context),
        media: const _VideoFallback(),
        badge: const _PlayBadge(),
        overlay: showQuickSave && !alreadySaved && !isItSavedStatus(videoPath)
            ? QuickSaveButton(statusPath: videoPath)
            : null,
      ),
      data: (bytes) {
        return StatusMediaCard(
          statusPath: videoPath,
          onOpen: () => _open(context),
          overlay: showQuickSave && !alreadySaved && !isItSavedStatus(videoPath)
              ? QuickSaveButton(statusPath: videoPath)
              : null,
          badge: const _PlayBadge(),
          media: bytes == null
              ? const _VideoFallback()
              : Image.memory(
                  bytes,
                  fit: BoxFit.cover,
                  gaplessPlayback: true,
                  filterQuality: FilterQuality.low,
                ),
        );
      },
    );
  }

  void _open(BuildContext context) {
    Navigator.of(context).push(
      CinemaPageRoute(
        builder: (context) => VideoView(videoPath: videoPath),
      ),
    );
  }
}

class _PlayBadge extends StatelessWidget {
  const _PlayBadge();

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.play_circle_fill_rounded,
      size: 44,
      color: AppColors.playBadge,
    );
  }
}

class _VideoFallback extends StatelessWidget {
  const _VideoFallback();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: const SizedBox(height: 180, width: double.infinity),
    );
  }
}
