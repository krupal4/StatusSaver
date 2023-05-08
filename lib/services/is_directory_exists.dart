import 'dart:io';

import 'package:status_saver/common.dart';

Future<bool> isDirectoryExists({required List<String> directoriesPath}) async {

  for(String directoryPath in directoriesPath) {
    bool isDirExists = await Directory(directoryPath).exists();
    log(directoryPath + ' ' + isDirExists.toString());

    if(isDirExists) return true;
  }
  return false;
}