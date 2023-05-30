import 'dart:io';

import 'package:status_saver/common.dart';
import 'package:status_saver/models/tab_type.dart';

Future<bool> isDirectoryExists({required TabType tabType}) async {
  final List<String> directoryPaths = getDirectoryPaths(tabType);

  for (String directoryPath in directoryPaths) {
    bool isDirExists = await Directory(directoryPath).exists();
    log("$directoryPath :: $isDirExists");
    if (isDirExists) return true;
  }
  return false;
}
