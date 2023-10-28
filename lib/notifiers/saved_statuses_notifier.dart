import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

import '../common.dart';

class SavedStatusesNotifier extends StateNotifier<Statuses> {
  SavedStatusesNotifier() : super([]);

  late List<Permission> _storagePermission;

  Future<void> initialize() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    if (androidInfo.version.sdkInt >= 31) {
      _storagePermission = [Permission.photos, Permission.videos];
    } else {
      _storagePermission = [Permission.storage];
    }
  }

  void refresh() {
    // TODO: implement
  }

  Future<bool> saveStatus(String statusPath) async {
    // TODO: implement
    return true;
  }

  Future<bool> deleteStatus(String statusPath) async {
    // TODO: implement
    return true;
  }

  Future<bool> get isStoragePermitted async {
    for (final element in _storagePermission) {
      if (!await element.isGranted) {
        return false;
      }
    }
    return true;
  }
}
