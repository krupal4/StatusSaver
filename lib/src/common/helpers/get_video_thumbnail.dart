import 'package:flutter/foundation.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

Future<Uint8List?> getVideoThumbnailData(String videoPath) async {
  return VideoThumbnail.thumbnailData(
    video: videoPath,
    imageFormat: ImageFormat.JPEG,
    maxWidth: 320,
    quality: 50,
  );
}
