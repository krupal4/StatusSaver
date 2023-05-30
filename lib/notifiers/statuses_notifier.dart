import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:status_saver/common.dart';
import 'package:status_saver/models/tab_type.dart';

class StatusesNotifier extends StateNotifier<List<String>?> {
  final List<String> _statusesDirectoryPaths = [];
  final TabType _tabType;
  StatusesNotifier(this._tabType) : super(null) {
    final List<String> statusesDirectoryPaths = getDirectoryPaths(_tabType);

    for (String statusesDirectoryPath in statusesDirectoryPaths) {
      if (Directory(statusesDirectoryPath).existsSync()) {
        _statusesDirectoryPaths.add(statusesDirectoryPath);
      }
    }
    _getStatuses();
  }

  void _getStatuses() {
    List<String>? statuses;
    for (final String statusesDirectoryPath in _statusesDirectoryPaths) {
      Directory dir = Directory(statusesDirectoryPath);
      final List<String> tempStatuses = dir
          .listSync()
          .map((fileSystemEntity) => fileSystemEntity.path)
          .where(isItStatusFile)
          .toList()
          .reversed
          .toList(); // FIXME: implement timewise sort
      try {
        statuses!.addAll(tempStatuses);
      } catch (e) {
        statuses = tempStatuses;
      }
    }
    if (state == null || !state!.equals(statuses ?? [])) {
      state = statuses;
    }
  }

  void initialize() async {
    final List<String> statusesDirectoryPaths = getDirectoryPaths(_tabType);

    for (String statusesDirectoryPath in statusesDirectoryPaths) {
      if (Directory(statusesDirectoryPath).existsSync()) {
        _statusesDirectoryPaths.add(statusesDirectoryPath);
      }
    }

    _getStatuses();
  }

  /// statuses will not make request to directory returns saved list
  List<String>? get statuses => state;

  void remove(String statusPath) {
    state!.remove(statusPath);
  }
}

extension MyFancyList<String> on List<String> {
  bool equals(List<String> list) {
    if (length != list.length) return false;

    for (String item in this) {
      if (!list.contains(item)) {
        return false;
      }
    }
    return true;
  }
}
