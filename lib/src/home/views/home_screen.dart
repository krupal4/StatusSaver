import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:status_saver/src/common/extensions/async_value.dart';
import 'package:status_saver/src/debug/console_log.dart';
import 'package:status_saver/src/home/models/tab_type.dart';
import 'package:status_saver/src/home/notifiers/selected_tab_index_notifier.dart';
import 'package:status_saver/src/home/services/whatsapp_type_notifier.dart';
import 'package:status_saver/src/home/views/my_drawer.dart';
import 'package:status_saver/src/localization/extensions/on_build_context.dart';
import 'package:status_saver/src/statuses/views/statuses_screen.dart';
import 'package:status_saver/src/storage_permission/notifiers/storage_permission_notifier.dart';
import 'package:status_saver/src/storage_permission/views/give_permissions_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: Text(context.l10n.appTitle),
      ),
      bottomNavigationBar: _navigationBar(context, ref),
      body: [
        () => _recentStatusesScreen(ref),
        () => _savedStatusesScreen(ref),
      ][ref.watch(selectedTabIndexProvider)](),
      drawer: const MyDrawer(),
    );
  }

  Widget _recentStatusesScreen(WidgetRef ref) =>
      ref.watch(whatsAppTypeProvider).whenWidget(
        (whatsAppType) {
          if (whatsAppType == null) {
            return const Center(
                child: Text("No WhatsApp found on this mobile."));
          }
          final AsyncValue<bool> storagePermissionAsync =
              ref.watch(recentStoragePermissionProvider);
          return storagePermissionAsync.whenWidget(
            (isStoragePermitted) {
              return isStoragePermitted
                  ? const StatusesScreen(tabType: StatusTabType.recent)
                  : GivePermissionsScreen(
                      onRequestPermission: ref
                          .read(recentStoragePermissionProvider.notifier)
                          .request,
                    );
            },
          );
        },
      );

  Widget _savedStatusesScreen(WidgetRef ref) =>
      ref.watch(savedStoragePermissionProvider).whenWidget(
        (isStoragePermitted) {
          consoleLog(isStoragePermitted, "saves storage permitted?");
          return isStoragePermitted
              ? const StatusesScreen(
                  tabType: StatusTabType.saved,
                )
              : GivePermissionsScreen(
                  onRequestPermission:
                      ref.read(savedStoragePermissionProvider.notifier).request,
                );
        },
      );

  NavigationBar _navigationBar(BuildContext context, WidgetRef ref) {
    final int selectedTabIndex = ref.watch(selectedTabIndexProvider);
    return NavigationBar(
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
          selectedIcon: const Icon(Icons.save_rounded),
          icon: const Icon(Icons.save_outlined),
          label: context.l10n.savedStatuses,
        ),
      ],
    );
  }
}
