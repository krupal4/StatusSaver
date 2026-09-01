import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:status_saver/src/common/helpers/app_haptics.dart';
import 'package:status_saver/src/common/helpers/app_snackbar.dart';
import 'package:status_saver/src/localization/extensions/on_build_context.dart';
import 'package:status_saver/src/statuses/notifiers/statuses_notifier.dart';
import 'package:status_saver/src/theme/colors.dart';

class QuickSaveButton extends ConsumerWidget {
  const QuickSaveButton({super.key, required this.statusPath});

  final String statusPath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Tooltip(
      message: context.l10n.quickSaveTooltip,
      child: Material(
        color: AppColors.glassFill,
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: () async {
            AppHaptics.light();
            final bool saved = await ref
                .read(savedStatusesProvider.notifier)
                .saveStatus(statusPath);
            if (!context.mounted) {
              return;
            }
            showAppSnackBar(
              context,
              saved
                  ? context.l10n.statusSavedMessage
                  : context.l10n.saveFailedMessage,
            );
          },
          child: const Padding(
            padding: EdgeInsets.all(8),
            child: Icon(
              Icons.download_rounded,
              size: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
