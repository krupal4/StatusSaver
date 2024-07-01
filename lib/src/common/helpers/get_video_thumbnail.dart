import 'package:flutter/foundation.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

Future<Uint8List?> getVideoThumbnailData(String videoPath) async {
  return await VideoThumbnail.thumbnailData(
    video: videoPath,
    imageFormat: ImageFormat.JPEG,
    quality: 50,
  );
}
