import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

import 'common.dart';
import 'notifiers/locale_notifier.dart';
import 'notifiers/recent_statuses_notifier.dart';
import 'notifiers/saved_statuses_notifier.dart';
import 'notifiers/storage_permission_notifier.dart';
import 'notifiers/theme_mode_notifier.dart';

final localeProvider = StateNotifierProvider<LocaleNotifier, Locale?>(
    (ref) => LocaleNotifier());

final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode?>(
    (ref) => ThemeModeNotifier());

final storagePermissionProvider =
    StateNotifierProvider<StoragePermissionNotifier, PermissionStatus?>(
        (ref) => StoragePermissionNotifier());

final recentStatusesProvider =
    StateNotifierProvider<RecentStatusesNotifier, Statuses>(
        (ref) => RecentStatusesNotifier());

final savedStatusesProvider =
    StateNotifierProvider<SavedStatusesNotifier, Statuses>(
        (ref) => SavedStatusesNotifier());

