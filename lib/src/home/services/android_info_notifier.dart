import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:status_saver/src/home/models/android_info.dart';

final androidInfoProvider = FutureProvider<AndroidInfo>((ref) async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  final int androidSdkApiLevel = androidInfo.version.sdkInt;

  final bool isAndroid11OrLater = androidSdkApiLevel >= 30;
  final bool isAndroid13OrLater = androidSdkApiLevel >= 33;
  return AndroidInfo(
    androidSdkApiLevel: androidSdkApiLevel,
    isAndroid11OrLater: isAndroid11OrLater,
    isAndroid13OrLater: isAndroid13OrLater,
  );
});
