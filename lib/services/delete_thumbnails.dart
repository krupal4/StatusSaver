import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:status_saver/common.dart';
import 'package:status_saver/constants.dart';

// delete thumbnails of recent statuses which are not present
Future<void> deleteUnnecessaryThumbnailsIsolate(List<String> statuses) async {
  await compute(deleteUnnecessaryThumbnails, statuses);
}

void deleteUnnecessaryThumbnails(List<String> statuses) {
  if(!File(thumbnailsDirectoryPath).existsSync()) return;
  List<String> usedThumbnails = statuses.where((e) => e.endsWith(mp4)).map((e) => getThumbnailPath(e)).toList();
  List<String> thumbnails = Directory(thumbnailsDirectoryPath).listSync().map((e) => e.path).toList();

  for(String thumbnail in thumbnails) {
    if(!usedThumbnails.contains(thumbnail)) {
      // delete thumbnail
      File(thumbnail).delete();
    }
  }
}