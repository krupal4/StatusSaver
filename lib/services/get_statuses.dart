import 'dart:io';

import 'package:status_saver/common.dart';
import 'package:status_saver/constants.dart';
import 'package:status_saver/models/tab_type.dart';

List<String> getStatuses({required TabType tabType}) {
  final List<String> directoryPaths = tabType == TabType.recent
      ? recentDirectoryPaths
      : const [savedStatusesDirectory];

  List<String> statuses = [];
  for (String directoryPath in directoryPaths) {
    try {
      Directory dir = Directory(directoryPath);
      if (dir.existsSync()) {
        statuses.addAll(dir.listSync().map((file) {
          return file.path;
        }));
      }
      // TODO: handle stream of list using directory.list()
    } catch (e) {
      log(e.toString());
    }
  }
  return filter(statuses);
}

/// remove unnecessary files which are not statuses
List<String> filter(List<String> statuses) {
  return statuses.where((status) {
    // TODO: datewise sorting
    return status.endsWith(mp4) || status.endsWith(jpg);
  }).toList();
}
