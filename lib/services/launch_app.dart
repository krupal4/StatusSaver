import 'package:device_apps/device_apps.dart';

Future<void> launchApp({required String packageName}) async {  
  bool isInstalled = await DeviceApps.isAppInstalled(packageName);
  if(isInstalled)
  {
    await DeviceApps.openApp(packageName);
    return;
  }
  throw 'Could not launch App';
}