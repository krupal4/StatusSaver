import 'dart:io';

import 'package:status_saver/common.dart';
import 'package:status_saver/models/tab_type.dart';

class StatusesProvider extends ChangeNotifier {
  List<String>? _statuses;
  
  void initialize(TabType tabType) async {
    // const List<String> statusesDirectoryPaths = recentDirectoryPaths;
    final List<String> statusesDirectoryPaths = getDirectoryPaths(tabType);
    for (final String statusesDirectoryPath in statusesDirectoryPaths) {
      try {
        Directory dir = Directory(statusesDirectoryPath);
        if (dir.existsSync()) {
          dir.list()
          .map((fileSystemEntity) => fileSystemEntity.path)
          .where(isItStatusFile)
          .listen((filePath) {
            try {
              _statuses!.add(filePath);
              log('path path path $filePath');
            } catch (_) {
              _statuses = [filePath];
            }
            notifyListeners();
          });
        }
      } catch (e) {
        log(e.toString());
      }
    }
  }

  List<String>? get statuses => _statuses;
}
