import 'package:flutter/material.dart';
import 'package:status_saver/src/common/helpers/app_haptics.dart';
import 'package:status_saver/src/common/views/empty_state.dart';
import 'package:status_saver/src/localization/extensions/on_build_context.dart';

class GivePermissionsScreen extends StatelessWidget {
  const GivePermissionsScreen({
    super.key,
    required this.onRequestPermission,
  });
  final VoidCallback onRequestPermission;

  @override
  Widget build(BuildContext context) {
    return AppEmptyState(
      icon: Icons.folder_open_rounded,
      title: context.l10n.permissionTitle,
      message:
          '${context.l10n.needToGiveStoragePermission}\n\n${context.l10n.permissionPrivacyNote}',
      action: FilledButton.icon(
        onPressed: () {
          AppHaptics.medium();
          onRequestPermission();
        },
        icon: const Icon(Icons.lock_open_rounded),
        label: Text(context.l10n.giveStoragePermission),
      ),
    );
  }
}
