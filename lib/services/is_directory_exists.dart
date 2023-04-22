import 'dart:io';

Future<bool> isDirectoryExists({required List<String> directoriesPath}) async {
  bool isExists = false;

  for(String directoryPath in directoriesPath) {
    isExists = isExists || await Directory(directoryPath).exists();

    if(isExists) return true;
  }
  return false;
}