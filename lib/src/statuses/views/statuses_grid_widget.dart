import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:status_saver/src/statuses/views/image_tile.dart';
import 'package:status_saver/src/statuses/views/video_tile.dart';

class StatusesGridWidget extends StatelessWidget {
  const StatusesGridWidget({
    super.key,
    required this.scrollController,
    required this.statuses,
    required this.noStatusesFoundMessage,
  });
  final List<String> statuses;
  final ScrollController scrollController;
  final String noStatusesFoundMessage;

  @override
  Widget build(BuildContext context) {
    return statuses.isEmpty
        ? Center(
            child: Text(
              noStatusesFoundMessage,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          )
        : MasonryGridView.count(
            controller: scrollController,
            cacheExtent: 9999,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            crossAxisCount: 2,
            mainAxisSpacing: 1,
            crossAxisSpacing: 5,
            itemCount: statuses.length,
            itemBuilder: (context, index) {
              final String statusPath = statuses[index];
              if (statusPath.endsWith(".jpg")) {
                return ImageTile(imagePath: statusPath);
              } else {
                return VideoTile(videoPath: statusPath);
              }
            },
          );
  }
}
