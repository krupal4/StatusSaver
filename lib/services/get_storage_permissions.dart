import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> getStoragePermissions() async {

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  final PermissionStatus permissionStatus;
  final Permission permission;
  bool isStoragePermitted = true;

  permission = androidInfo.version.sdkInt >= 31 
    ? Permission.manageExternalStorage
    : Permission.storage;
  permissionStatus = await permission.request();

  if(permissionStatus != PermissionStatus.granted) {
      isStoragePermitted = false;
  }
  return isStoragePermitted;
}