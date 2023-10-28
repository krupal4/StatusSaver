import 'dart:io';

import 'package:device_apps/device_apps.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saf/saf.dart';

import '../common.dart';
import '../constants.dart';

class RecentStatusesNotifier extends StateNotifier<Statuses> {
  RecentStatusesNotifier() : super([]);

  bool isWhatsappExists = false;
  bool isW4bExists = false;
  bool _isWhatsappSafPermitted = false;
  bool _isW4bSafPermitted = false;

  bool get isAppExists => isWhatsappExists || isW4bExists;
  bool get isSafPermitted => _isWhatsappSafPermitted || _isW4bSafPermitted;
  bool get isWhatsappSafPermitted => _isWhatsappSafPermitted;
  bool get isW4bSafPermitted => _isW4bSafPermitted;
  Statuses get statuses => state;

  set isWhatsappSafPermitted(bool isGranted) {
    log('isWhatsappSaf setter isGranted: $isGranted');
    if(!isGranted) {
      _isWhatsappSafPermitted = false;
    }
    for(String path in whatsappRecentDirectoryRelativePaths) {
      if(Directory("/storage/emulated/0/$path").existsSync()) {
        log("in saf path: $path");
        Saf(path).getDirectoryPermission().then((isGrantedSaf) => {
          _isWhatsappSafPermitted = isGrantedSaf ?? false
        });
      }
    }
  }

  set isW4bSafPermitted(bool isGranted) {
    if(!isGranted) {
      _isW4bSafPermitted = false;
    }
    for(String path in w4bRecentDirectoryRelativePaths) {
      if(Directory(path).existsSync()) {
        Saf(path).getDirectoryPermission().then((isGrantedSaf) => {
          _isW4bSafPermitted = isGrantedSaf ?? false
        });
      }
    }
  }

  Future<void> initialize() async {
    await DeviceApps.getInstalledApplications().then((applications) {
      debugPrint(applications.map((e) => e.packageName).toString());
      isWhatsappExists = applications.any((application) =>
          application.packageName == whatsappPackageName);
      isW4bExists = applications.any((application) =>
          application.packageName == w4bPackageName);
    });
    debugPrint("wp: $isWhatsappExists w4b:$isW4bExists");
  }

  void refresh() {
    // TODO: implement
  }
}
