import 'dart:io';

import 'package:status_saver/src/home/models/whatsapp_type_enum.dart';

String getStatusesPath(WhatsAppType whatsAppType, bool isAndroid11OrLater, bool isAndroid10OrBefore) {
  if (whatsAppType == WhatsAppType.whatsApp) {
    if (isAndroid11OrLater) {
      return "Android/media/com.whatsapp/WhatsApp/Media/.Statuses";
    } else if (isAndroid10OrBefore) {
      return "/storage/emulated/0/WhatsApp/Media/.Statuses/"; // Path for Android 10 or below
    } else {
      return "Android/media/com.whatsapp/WhatsApp/Media/.Statuses";
    }
  } else if (whatsAppType == WhatsAppType.w4b) {
    if (isAndroid11OrLater) {
      return "Android/media/com.whatsapp.w4b/WhatsApp Business/Media/.Statuses";
    } else if (isAndroid10OrBefore) {
      return "/storage/emulated/0/WhatsApp Business/Media/.Statuses/"; // Path for Android 10 or below
    } else {
      return "Android/media/com.whatsapp.w4b/WhatsApp Business/Media/.Statuses";
    }
  } else {
    throw Exception("Please provide statuses dir path for whatsapp type: '$whatsAppType'");
  }
}

bool isItStatusFile(String filePath) {
  return filePath.endsWith(".mp4") || filePath.endsWith(".jpg");
}

List<String> getDirectoryFilePaths(
  String dirPath, {
  bool Function(String)? whereCallback,
}) {
  whereCallback ??= (_) => true;

  try {
    Directory dir = Directory(dirPath);
    if (!dir.existsSync()) {
      return [];
    }

    return dir
        .listSync()
        .map((fileSystemEntity) => fileSystemEntity.path)
        .where(whereCallback)
        .toList();
  } catch (e) {
    return List.empty();
  }
}
