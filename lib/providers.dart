
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

import 'common.dart';
import 'models/tab_type.dart';
import 'notifiers/locale_notifier.dart';
import 'notifiers/statuses_notifier.dart';
import 'notifiers/storage_permission_notifier.dart';
import 'notifiers/theme_mode_notifier.dart';


final localeProvider = StateNotifierProvider<LocaleNotifier, Locale?>(
    (ref) => LocaleNotifier()..initialize());
    
final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode?>(
    (ref) => ThemeModeNotifier()..initialize());

final storagePermissionProvider =
    StateNotifierProvider<StoragePermissionNotifier, PermissionStatus?>(
        (ref) => StoragePermissionNotifier());

final recentStatusesProvider =
    StateNotifierProvider<StatusesNotifier, List<String>?>(
        (ref) => StatusesNotifier(TabType.recent));

final savedStatusesProvider =
    StateNotifierProvider<StatusesNotifier, List<String>?>(
        (ref) => StatusesNotifier(TabType.saved));

