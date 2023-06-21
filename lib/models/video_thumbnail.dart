import 'package:status_saver/constants.dart';

class VideoThumbnail {
  final String path;
  // late final double videoHeight;
  // late final double videoWidth;
  double videoHeight = 50;
  double videoWidth = 40;
  VideoThumbnail(this.path);

  set height(double height) {
    this.height = height;
  }

  set width(double width) {
    this.width = width;
  }

  factory VideoThumbnail.placeholder() {
    final videoThumbnail = VideoThumbnail(placeholderVideoThumbnailPath);
    videoThumbnail.videoHeight = 50;
    videoThumbnail.videoWidth = 40;
    return videoThumbnail;
  }
}