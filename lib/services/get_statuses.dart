import 'dart:io';

import 'package:status_saver/common.dart';
import 'package:status_saver/constants.dart';

import 'get_storage_permissions.dart';

Future<List<FileSystemEntity>> getStatuses() async {

  // check for storage permissions
  if(await getStoragePermissions() == true) {
    Directory whatsAppStatusesDirectory = Directory(whatsAppStatusesLocalPath);
    Directory whatsAppBusinessStatusesDirectory = Directory(whatsAppBusinessStatusesLocalPath);
    List<FileSystemEntity> statuses = [];
    bool whatsappExists = true, whatsappBusinessExists = true;

    if(whatsAppStatusesDirectory.existsSync()) {
      statuses.addAll(whatsAppStatusesDirectory.listSync());
    } else {
      whatsappExists = false;
    }

    if(whatsAppBusinessStatusesDirectory.existsSync()) {
      statuses.addAll(whatsAppBusinessStatusesDirectory.listSync());
    } else {
      whatsappBusinessExists = false;
    }

    if(!whatsappExists && !whatsappBusinessExists) {
      // alert: whatsapp or whatsapp business not found on your mobile
      log('Whatsapp or W4B not found on your mobile');
      return [];
    }

    return filter(statuses);
  }

  // please give permissions
  return [];
}

/// remove unnecessary files which are not statuses
List<FileSystemEntity> filter(List<FileSystemEntity> statues) {
  return statues.where((status) {
    return status.path.endsWith('.mp4') || status.path.endsWith('.jpg');
  }).toList();
}