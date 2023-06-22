import 'dart:io';

import 'package:status_saver/common.dart';
import 'package:status_saver/constants.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:status_saver/models/video_thumbnail.dart' as model;

Future<model.VideoThumbnail> getVideoThumbnail(String videoPath) async {
  final String thumbnailPath = getThumbnailPath(videoPath);
  model.VideoThumbnail videoThumbnail = model.VideoThumbnail(thumbnailPath); 
  if(await File(thumbnailPath).exists()) {
    final image = await decodeImageFromList(await File(thumbnailPath).readAsBytes());
    videoThumbnail.height = image.height * 1.0;
    videoThumbnail.width = image.width * 1.0;
    return videoThumbnail;
  } 

  final thumbnailData = await VideoThumbnail.thumbnailData(
    video: videoPath,
    quality: 75
  );

  // Ensure thumbnails folder exists
  if(!Directory(thumbnailsDirectoryPath).existsSync()) {
    Directory(thumbnailsDirectoryPath).createSync(recursive: true);
  }

  if (thumbnailData != null) {
    // get height and width of video
    final image = await decodeImageFromList(thumbnailData);
    videoThumbnail.height = image.height * 1.0; 
    videoThumbnail.width = image.width * 1.0; 
    final thumbnailFile = File(videoThumbnail.path);
    await thumbnailFile.writeAsBytes(thumbnailData);
    return videoThumbnail;
  } else {
    // Failed to generate thumbnail.
    return model.VideoThumbnail.placeholder();
  }
}