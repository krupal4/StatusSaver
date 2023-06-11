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
    state = _getStatuses();
  }

  List<String>? _getStatuses() {
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
    return statuses;
  }

  List<String>? get statuses => state;

  void add(String statusPath) {
    try {
      state!.insert(0, statusPath);
    } catch(_) {
      state = [ statusPath ];
    }
  }

  void remove(String statusPath) {
    List<String> tempState = state!;
    tempState.remove(statusPath);  
    state = [...tempState];
    File(statusPath).deleteSync();
  }

  void refresh() {
    List<String> newState = _getStatuses() ?? [];
    if(!newState.equals(state ?? [])) {
      state = newState;
    }
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
