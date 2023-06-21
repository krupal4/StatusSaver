import 'package:flutter/material.dart';
import 'package:status_saver/constants.dart';
import 'package:status_saver/models/tab_type.dart';

export 'package:flutter/material.dart';
export 'package:flutter_gen/gen_l10n/app_localizations.dart';

void log(String message) {
  debugPrint("---------------------------------------------");
  debugPrint(message);
  debugPrint("---------------------------------------------");
}

void pop(BuildContext context) {
  return Navigator.of(context).pop();
}

List<String> getDirectoryPaths(TabType tabType) {
  return tabType == TabType.recent
    ? recentDirectoryPaths
    : const [savedStatusesDirectory];
}

bool isItStatusFile(String filePath) {
  return filePath.endsWith(mp4) || filePath.endsWith(jpg);
}

String getSavedStatusPath(String statusPath) => "$savedStatusesDirectory/${statusPath.split('/').last}";

bool isItSavedStatus(statusPath) => getSavedStatusPath(statusPath).compareTo(statusPath) == 0;

String getThumbnailPath(String videoPath) {
  return "$thumbnailsDirectoryPath/${videoPath.split("/").last.replaceAll(mp4, png)}";
}