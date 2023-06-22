import 'package:status_saver/constants.dart';

class VideoThumbnail {
  final String path;
  late final double videoHeight;
  late final double videoWidth;
  VideoThumbnail(this.path);

  set height(double height) {
    videoHeight = height;
  }

  set width(double width) {
    videoWidth = width;
  }

  factory VideoThumbnail.placeholder() {
    final videoThumbnail = VideoThumbnail(placeholderVideoThumbnailPath);
    videoThumbnail.videoHeight = 50;
    videoThumbnail.videoWidth = 40;
    return videoThumbnail;
  }
}