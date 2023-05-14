import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> getStoragePermissions() async {

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  late final Map<Permission,PermissionStatus> permissionStatuses;
  bool isStoragePermitted = true;

  if (androidInfo.version.sdkInt >= 31) {
    permissionStatuses = await [
      Permission.manageExternalStorage
    ].request();
  } else {
    permissionStatuses = await [
      Permission.storage
    ].request();
  }

  permissionStatuses.forEach((_, permissionStatus) {
    if(permissionStatus != PermissionStatus.granted) {
      isStoragePermitted = false;
    }
  });
  return isStoragePermitted;
}