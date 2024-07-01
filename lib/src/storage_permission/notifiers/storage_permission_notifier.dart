import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:saf/saf.dart';
import 'package:status_saver/src/common/constants/directory_paths.dart';
import 'package:status_saver/src/common/helpers/storage_helper.dart';
import 'package:status_saver/src/debug/console_log.dart';
import 'package:status_saver/src/home/models/tab_type.dart';
import 'package:status_saver/src/home/services/android_info_notifier.dart';
import 'package:status_saver/src/home/services/whatsapp_type_notifier.dart';
import 'package:status_saver/src/common/extensions/permission_handler.dart';

class StoragePermissionNotifier
    extends FamilyAsyncNotifier<bool, StatusTabType> {
  Saf? _saf;
  late final String? _statusesPath;

  @override
  FutureOr<bool> build(StatusTabType arg) async {
    state = const AsyncValue.loading();
    _statusesPath = await _getStatusesDirPath();
    await _initPlatformSpecificMembers();
    return await isStoragePermitted();
  }

  Saf? saf() => _saf;
  String? statusesPath() => _statusesPath;

  Future<void> request() async {
    state = const AsyncValue.loading();
    final bool isPermitted = await _requestStoragePermission(_saf);
    state = AsyncData(isPermitted);
  }

  Future<bool> isStoragePermitted() async {
    try {
      if (arg == StatusTabType.recent) {
        if (_saf != null) {
          return await _saf!.getDirectoryPermission(isDynamic: true) ?? false;
        } else {
          return await Permission.storage.isGranted;
        }
      } else if (arg == StatusTabType.saved) {
        final androidInfoNotifier = await ref.read(androidInfoProvider.future);
        return androidInfoNotifier.isAndroid13OrLater
            ? await [
                Permission.photos,
                Permission.videos,
              ].isGranted
            : await Permission.storage.isGranted;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> _requestStoragePermission(Saf? saf) async {
    if (arg == StatusTabType.recent) {
      try {
        if (saf != null) {
          return await saf.getDirectoryPermission(isDynamic: true) ?? false;
        } else {
          return await Permission.storage.request().isGranted;
        }
      } catch (e) {
        consoleLog("error in storage_helper/requestStoragePermission: $e");
        return false;
      }
    } else if (arg == StatusTabType.saved) {
      consoleLog("in saved request ok");

      final androidInfoNotifier = await ref.read(androidInfoProvider.future);
      return androidInfoNotifier.isAndroid13OrLater
          ? await [
              Permission.photos,
              Permission.videos,
            ].requestAndHandle()
          : await Permission.storage.requestAndHandle();
    } else {
      return false;
    }
  }

  Future<void> _initPlatformSpecificMembers() async {
    final androidInfo = await ref.watch(androidInfoProvider.future);

    if (arg == StatusTabType.recent && androidInfo.isAndroid11OrLater) {
      final whatsAppType = await ref.watch(whatsAppTypeProvider.future);

      if (whatsAppType == null) {
        state = AsyncError("Whats app not found", StackTrace.current);
        return;
      }
      _saf = Saf(_statusesPath!);
    }
  }

  void releasePermissions() {
    state = const AsyncValue.data(false);
  }

  Future<String> _getStatusesDirPath() async {
    if (arg == StatusTabType.recent) {
      return getStatusesPath(
        (await ref.read(whatsAppTypeProvider.future))!,
        (await ref.read(androidInfoProvider.future)).isAndroid11OrLater,
      );
    } else if (arg == StatusTabType.saved) {
      return savedStatusesDirectory;
    } else {
      return "";
    }
  }
}

final storagePermissionProvider = AsyncNotifierProvider.family<
    StoragePermissionNotifier,
    bool,
    StatusTabType>(StoragePermissionNotifier.new);

final recentStoragePermissionProvider =
    storagePermissionProvider(StatusTabType.recent);

final savedStoragePermissionProvider =
    storagePermissionProvider(StatusTabType.saved);
