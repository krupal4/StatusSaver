import 'dart:io';

import 'package:video_thumbnail/video_thumbnail.dart';

Future<String> getVideoThumbnail (String videoPath) async {
  String? thumbnailPath = videoPath.replaceAll('.mp4', '.png');
  
  return await File(thumbnailPath).exists().then((isExists) async {
    if(isExists) {
      return thumbnailPath!;
    } else {
      thumbnailPath = await VideoThumbnail.thumbnailFile(video: videoPath);
      return thumbnailPath!;
    }
  });
}