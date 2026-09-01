import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      return statusesDirAllFiles.where(isItStatusFile).toList()
        ..sort(_byNewestFirst);
    } else if (arg == StatusTabType.saved) {
      final savedStatusesNotifier =
          ref.read(savedStoragePermissionProvider.notifier);
      final String? savedPath = savedStatusesNotifier.statusesPath();
      if (savedPath == null) {
        return List.empty();
      }
      return getDirectoryFilePaths(
        savedPath,
        whereCallback: isItStatusFile,
      )..sort(_byNewestFirst);
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
      final String savedStatusPath = getSavedStatusPath(statusPath);
      await File(savedStatusPath).create(recursive: true);
      await File(statusPath).copy(savedStatusPath);
      final List<String> current = List<String>.from(state.value ?? []);
      if (!current.contains(savedStatusPath)) {
        current.insert(0, savedStatusPath);
        state = AsyncValue.data(current);
      }
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<bool> deleteStatus(String statusPath) async {
    final AsyncValue<List<String>> previousState = state;
    try {
      final File status = File(statusPath);
      if (await status.exists()) {
        await status.delete();
      }
      final List<String> current = List<String>.from(state.value ?? []);
      current.remove(statusPath);
      state = AsyncValue.data(current);
      return true;
    } catch (e) {
      consoleLog(e, "Error deleting file at path: $statusPath");
      state = previousState;
      return false;
    }
  }
}

int _byNewestFirst(String a, String b) {
  return _mtime(b).compareTo(_mtime(a));
}

int _mtime(String path) {
  try {
    return File(path).lastModifiedSync().millisecondsSinceEpoch;
  } catch (_) {
    return 0;
  }
}

final statusesProvider =
    AsyncNotifierProvider.family<StatusesNotifier, List<String>, StatusTabType>(
        () => StatusesNotifier());

final recentStatusesProvider = statusesProvider(StatusTabType.recent);
final savedStatusesProvider = statusesProvider(StatusTabType.saved);

final savedStatusFilenamesProvider = Provider<Set<String>>((ref) {
  return ref.watch(savedStatusesProvider).maybeWhen(
        data: (paths) => paths.map((path) => path.split('/').last).toSet(),
        orElse: () => const <String>{},
      );
});
