import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:status_saver/common.dart';
import 'package:status_saver/services/show_without_ui_block_message.dart';

class GivePermissionsScreen extends StatelessWidget {
  const GivePermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("Give Storage Permission"), // TODO: localize
          onPressed: () async {
            DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
            AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
            PermissionStatus permissionStatus;
            Permission permission;
            if (androidInfo.version.sdkInt >= 31) {
              permission = Permission.manageExternalStorage;
            } else {
              permission = Permission.storage;
            }
            permissionStatus = await permission.request();

            if(permissionStatus.isPermanentlyDenied || permissionStatus.isRestricted) {
              openAppSettings()
              .then((value) {
                if(!value) {
                  showMessageWithoutUiBlock(message: "Could not open app settings for storage permission."); // TODO: localize
                }
              });
              permission.status.isGranted.then((value){
                if(value) {
                  pop(context);
                }
              });
            } 
          },
        ),
      ),
    );
  }
}