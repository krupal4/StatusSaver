import 'dart:io';

import 'package:status_saver/constants.dart';
import 'package:status_saver/services/get_storage_permissions.dart';

Future<List<FileSystemEntity>> getStatuses({required List<String> directoryPaths}) async {

  // check for storage permissions
  if(await getStoragePermissions() == true) {
    List<FileSystemEntity> statuses = [];

    for(String directoryPath in directoryPaths) { 
      Directory directory = Directory(directoryPath);
      statuses.addAll(directory.listSync()); 
      // TODO: handle stream of list using directory.list()
    }

    return filter(statuses);
  }

  // please give permissions
  return [];
}

/// remove unnecessary files which are not statuses
List<FileSystemEntity> filter(List<FileSystemEntity> statuses) {
  return statuses.where((status) {
    // TODO: datewise sorting
    return status.path.endsWith(MP4) || status.path.endsWith(JPG);
  }).toList();
}