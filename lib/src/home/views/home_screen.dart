import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:status_saver/src/common/extensions/async_value.dart';
import 'package:status_saver/src/common/views/circular_loader.dart';
import 'package:status_saver/src/common/views/empty_state.dart';
import 'package:status_saver/src/home/models/tab_type.dart';
import 'package:status_saver/src/home/notifiers/selected_tab_index_notifier.dart';
import 'package:status_saver/src/home/services/whatsapp_type_notifier.dart';
import 'package:status_saver/src/home/views/media_filter_bar.dart';
import 'package:status_saver/src/home/views/settings_sheet.dart';
import 'package:status_saver/src/localization/extensions/on_build_context.dart';
import 'package:status_saver/src/statuses/views/statuses_screen.dart';
import 'package:status_saver/src/storage_permission/notifiers/storage_permission_notifier.dart';
import 'package:status_saver/src/storage_permission/views/give_permissions_screen.dart';
import 'package:status_saver/src/theme/app_theme.dart';
import 'package:status_saver/src/theme/tokens.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int selectedTabIndex = ref.watch(selectedTabIndexProvider);
    final ColorScheme colors = Theme.of(context).colorScheme;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppTheme.overlayStyle(Theme.of(context).brightness),
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          title: Text(context.l10n.appTitle),
          actions: [
            IconButton(
              tooltip: context.l10n.settingsTitle,
              onPressed: () => showSettingsSheet(context),
              icon: const Icon(Icons.settings_rounded),
            ),
          ],
          bottom: const MediaFilterBar(),
        ),
        body: IndexedStack(
          index: selectedTabIndex,
          children: const [
            _RecentStatusesTab(),
            _SavedStatusesTab(),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.fromLTRB(
            AppSpacing.md,
            0,
            AppSpacing.md,
            AppSpacing.xs + MediaQuery.paddingOf(context).bottom * 0.35,
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadii.xl),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.24),
                  blurRadius: 24,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppRadii.xl),
              child: NavigationBar(
                backgroundColor: colors.surfaceContainerHighest,
                selectedIndex: selectedTabIndex,
                onDestinationSelected: (value) =>
                    ref.read(selectedTabIndexProvider.notifier).set(value),
                destinations: [
                  NavigationDestination(
                    selectedIcon: const Icon(Icons.auto_stories_rounded),
                    icon: const Icon(Icons.auto_stories_outlined),
                    label: context.l10n.recentStatuses,
                  ),
                  NavigationDestination(
                    selectedIcon: const Icon(Icons.bookmark_rounded),
                    icon: const Icon(Icons.bookmark_outline_rounded),
                    label: context.l10n.savedStatuses,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RecentStatusesTab extends ConsumerWidget {
  const _RecentStatusesTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(whatsAppTypeProvider).whenWidget(
      onRetry: () => ref.invalidate(whatsAppTypeProvider),
      loading: CircularLoader.new,
      (whatsAppType) {
        if (whatsAppType == null) {
          return AppEmptyState(
            icon: Icons.chat_bubble_outline_rounded,
            title: context.l10n.whatsappMissingTitle,
            message: context.l10n.whatsappMissingMessage,
          );
        }
        return ref.watch(recentStoragePermissionProvider).whenWidget(
          onRetry: () => ref.invalidate(recentStoragePermissionProvider),
          loading: CircularLoader.new,
          (isStoragePermitted) {
            return isStoragePermitted
                ? const StatusesScreen(tabType: StatusTabType.recent)
                : GivePermissionsScreen(
                    onRequestPermission: () {
                      ref
                          .read(recentStoragePermissionProvider.notifier)
                          .request();
                    },
                  );
          },
        );
      },
    );
  }
}

class _SavedStatusesTab extends ConsumerWidget {
  const _SavedStatusesTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(savedStoragePermissionProvider).whenWidget(
      onRetry: () => ref.invalidate(savedStoragePermissionProvider),
      loading: CircularLoader.new,
      (isStoragePermitted) {
        return isStoragePermitted
            ? const StatusesScreen(tabType: StatusTabType.saved)
            : GivePermissionsScreen(
                onRequestPermission: () {
                  ref.read(savedStoragePermissionProvider.notifier).request();
                },
              );
      },
    );
  }
}
