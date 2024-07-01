import 'package:permission_handler/permission_handler.dart';
import 'package:status_saver/src/debug/console_log.dart';

extension CustomPermissionHandler on Permission {
  Future<bool> requestAndHandle() async {
    PermissionStatus status = await request();

    if (status.isPermanentlyDenied) {
      // The user opted to never again see the permission request dialog for this
      // app. The only way to change the permission's status now is to let the
      // user manually enables it in the system settings.
      openAppSettings();
    }
    return status.isGranted;
  }
}

extension CustomPermissionListHandler on List<Permission> {
  Future<bool> requestAndHandle() async {
    Iterable<PermissionStatus> statuses = (await request()).values;
    consoleLog(statuses, "statueses resp");

    if (statuses
        .any((status) => status == PermissionStatus.permanentlyDenied)) {
      // The user opted to never again see the permission request dialog for this
      // app. The only way to change the permission's status now is to let the
      // user manually enables it in the system settings.
      openAppSettings();
    }
    return statuses.every((status) => status.isGranted);
  }

  Future<bool> get isGranted async {
    return (await Future.wait(
      map((permission) => permission.status),
    ))
        .every((status) => status.isGranted);
  }
}
