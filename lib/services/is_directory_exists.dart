import 'dart:io';

import 'package:status_saver/common.dart';

Future<bool> isDirectoryExists({required List<String> directoriesPath}) async {
  bool isExists = false;

  for(String directoryPath in directoriesPath) {
    bool isDirExists = await Directory(directoryPath).exists();
    log(directoryPath + ' ' + isDirExists.toString());
    isExists = isExists || isDirExists;

    if(isExists) return true;
  }
  return false;
}