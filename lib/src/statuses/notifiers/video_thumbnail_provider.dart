import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:status_saver/src/common/helpers/get_video_thumbnail.dart';

final videoThumbnailProvider =
    FutureProvider.family<Uint8List?, String>((ref, videoPath) {
  return getVideoThumbnailData(videoPath);
});
