import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:status_saver/src/common/helpers/get_video_thumbnail.dart';
import 'package:status_saver/src/statuses/views/video_view.dart';

class VideoTile extends StatelessWidget {
  final String videoPath;
  const VideoTile({super.key, required this.videoPath});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: getVideoThumbnailData(videoPath),
      builder: ((_, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          return Card(
            elevation: 5,
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => VideoView(
                    videoPath: videoPath,
                    // height: snapshot.data!.videoHeight,
                    // width: snapshot.data!.videoWidth,
                  ),
                ),
              ),
              child: Stack(
                children: [
                  Hero(
                    tag: videoPath,
                    child: Image.memory(
                      fit: BoxFit.cover,
                      snapshot.data!,
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      color: Colors.black54,
                    ),
                  ),
                  const Positioned.fill(
                      child: Center(
                          child: Icon(
                    Icons.play_circle_fill_rounded,
                    size: 55,
                    color: Colors.grey,
                  )))
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
