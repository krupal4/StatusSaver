import 'dart:io';

import 'package:status_saver/common.dart';
import 'package:status_saver/models/tab_type.dart';

class StatusesProvider extends ChangeNotifier {
  List<String>? _statuses;
  final List<String> _statusesDirectoryPaths = [];
  
  List<String>? _getStatuses() {
    List<String>? statuses;
    for (final String statusesDirectoryPath in _statusesDirectoryPaths) {
      Directory dir = Directory(statusesDirectoryPath);
        final List<String> tempStatuses = dir.listSync()
        .map((fileSystemEntity) => fileSystemEntity.path)
        .where(isItStatusFile)
        .toList()
        .reversed
        .toList(); // FIXME: implement timewise sort 
        try {
          statuses!.addAll(tempStatuses);
        } catch(e) {
          statuses = tempStatuses;
        }
    }
    _statuses = statuses;
    return statuses;
  }

  void initialize(TabType tabType) async {
    final List<String> statusesDirectoryPaths = getDirectoryPaths(tabType);

    for(String statusesDirectoryPath in statusesDirectoryPaths) {
      if (Directory(statusesDirectoryPath).existsSync()) {
        _statusesDirectoryPaths.add(statusesDirectoryPath);
      }
    }

    _statuses = _getStatuses();
    notifyListeners();
  }

  /// statuses will not make request to directory returns saved list
  List<String>? get statuses => _statuses;

  /// getStatuses will request 
  List<String>? get getStatuses => _getStatuses();

  void refreshStatuses() {
    log('message in refresh');
    final List<String> statuses = _getStatuses() ?? [];
    if(!statuses.equals(_statuses ?? [])) {
      _statuses = statuses;
      notifyListeners();
      log('message in if');
    }
  }

  void remove(String statusPath) {
    _statuses!.remove(statusPath);
    notifyListeners();
  }
}

extension MyFancyList<String> on List<String> {
  bool equals(List<String> list) {
    if(length != list.length) return false;

    for(String item in this) {
      if(!list.contains(item)) {
        return false;
      }
    }
    return true;
  }
}