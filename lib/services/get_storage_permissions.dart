import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> getStoragePermissions() async {
  bool storage = true;
  bool manageExternalStorage = true;

  // Only check for storage < Android 13
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  if (androidInfo.version.sdkInt >= 33) {
    manageExternalStorage = await Permission.manageExternalStorage.status.isGranted;
  } else {
    storage = await Permission.storage.status.isGranted;
  }

  if (storage && manageExternalStorage) {
    return true;
  } else {
    // request for permission
    if (androidInfo.version.sdkInt >= 33) {
      Permission.manageExternalStorage.request();
      return await Permission.manageExternalStorage.status.isGranted;
    } else {
      Permission.storage.request();
      return await Permission.storage.status.isGranted;
    }
  }
}