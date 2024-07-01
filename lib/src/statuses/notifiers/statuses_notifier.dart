import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:saf/saf.dart';
import 'package:status_saver/src/common/helpers/statuses_helper.dart';
import 'package:status_saver/src/common/helpers/storage_helper.dart';
import 'package:status_saver/src/debug/console_log.dart';
import 'package:status_saver/src/home/models/tab_type.dart';
import 'package:status_saver/src/home/services/android_info_notifier.dart';
import 'package:status_saver/src/storage_permission/notifiers/storage_permission_notifier.dart';

class StatusesNotifier
    extends FamilyAsyncNotifier<List<String>, StatusTabType> {
  @override
  FutureOr<List<String>> build(StatusTabType arg) async {
    state = const AsyncValue.loading();
    return await getStatuses();
  }

  Future<List<String>> getStatuses() async {
    if (arg == StatusTabType.recent) {
      final androidInfo = await ref.watch(androidInfoProvider.future);
      List<String> statusesDirAllFiles;
      final recentStatusesNotifier =
          ref.read(recentStoragePermissionProvider.notifier);
      if (androidInfo.isAndroid11OrLater) {
        statusesDirAllFiles =
            await getStatusesDirFilesFromSaf(recentStatusesNotifier.saf()!);
      } else {
        statusesDirAllFiles = getDirectoryFilePaths(
          recentStatusesNotifier.statusesPath()!,
          whereCallback: isItStatusFile,
        );
      }
      return statusesDirAllFiles.where(isItStatusFile).toList();
    } else if (arg == StatusTabType.saved) {
      final savedStatusesNotifier =
          ref.read(savedStoragePermissionProvider.notifier);
      return getDirectoryFilePaths(
        savedStatusesNotifier.statusesPath()!,
        whereCallback: isItStatusFile,
      );
    } else {
      return List.empty();
    }
  }

  Future<List<String>> getStatusesDirFilesFromSaf(Saf saf) async {
    try {
      await saf.sync();
      List<String> statuses =
          await saf.getCachedFilesPath() ?? List<String>.empty();
      return statuses;
    } catch (e) {
      await saf.releasePersistedPermission();
      ref.read(recentStoragePermissionProvider.notifier).releasePermissions();
      return List<String>.empty();
    }
  }

  Future<bool> saveStatus(String statusPath) async {
    try {
      state = const AsyncLoading();
      final String savedStatusPath = getSavedStatusPath(statusPath);
      await File(savedStatusPath).create(recursive: true);
      await File(statusPath).copy(savedStatusPath);
      state = AsyncValue.data(await getStatuses());
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<bool> deleteStatus(String statusPath) async {
    final previousState = state;
    try {
      final File status = File(statusPath);
      state = const AsyncLoading();

      bool statusFileExists = await status.exists();
      if (!statusFileExists) {
        consoleLog("File does not exist at path: $statusPath");
        return true;
      }

      debugPrint("file exists: $statusFileExists");
      debugPrint(" file exists on '$statusPath'");
      debugPrint("stat: ${await status.stat()}");
      if (await Permission.storage.request().isGranted) {
        await status.delete(recursive: true);
      }
      consoleLog("Deleted file at path: $statusPath");

      state = AsyncValue.data(await getStatuses());
      return true;
    } catch (e) {
      consoleLog(e, "Error deleting file at path: $statusPath");
      state = previousState;
      return false;
    }
  }
}

final statusesProvider =
    AsyncNotifierProvider.family<StatusesNotifier, List<String>, StatusTabType>(
        () => StatusesNotifier());

final recentStatusesProvider = statusesProvider(StatusTabType.recent);
final savedStatusesProvider = statusesProvider(StatusTabType.saved);
