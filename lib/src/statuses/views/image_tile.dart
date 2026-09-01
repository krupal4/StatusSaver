import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:status_saver/src/common/helpers/cinema_route.dart';
import 'package:status_saver/src/common/helpers/media_decode.dart';
import 'package:status_saver/src/common/helpers/statuses_helper.dart';
import 'package:status_saver/src/statuses/notifiers/statuses_notifier.dart';
import 'package:status_saver/src/statuses/views/image_view.dart';
import 'package:status_saver/src/statuses/views/quick_save_button.dart';
import 'package:status_saver/src/statuses/views/status_media_card.dart';

class ImageTile extends ConsumerWidget {
  const ImageTile({
    super.key,
    required this.imagePath,
    this.showQuickSave = false,
  });

  final String imagePath;

  final bool showQuickSave;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool alreadySaved = ref.watch(savedStatusFilenamesProvider).contains(
          imagePath.split('/').last,
        );

    return StatusMediaCard(
      statusPath: imagePath,
      onOpen: () {
        Navigator.of(context).push(
          CinemaPageRoute(
            builder: (context) => ImageView(imagePath: imagePath),
          ),
        );
      },
      overlay: showQuickSave && !alreadySaved && !isItSavedStatus(imagePath)
          ? QuickSaveButton(statusPath: imagePath)
          : null,
      media: Image.file(
        File(imagePath),
        fit: BoxFit.cover,
        cacheWidth: gridImageCacheWidth(context),
        filterQuality: FilterQuality.low,
        gaplessPlayback: true,
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded || frame != null) {
            return child;
          }
          return const SizedBox(height: 180);
        },
      ),
    );
  }
}
