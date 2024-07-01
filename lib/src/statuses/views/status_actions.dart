import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:status_saver/src/common/helpers/show_toast.dart';
import 'package:status_saver/src/common/helpers/statuses_helper.dart';
import 'package:status_saver/src/debug/console_log.dart';
import 'package:status_saver/src/localization/extensions/on_build_context.dart';
import 'package:status_saver/src/statuses/notifiers/statuses_notifier.dart';

class StatusActions extends ConsumerWidget {
  final String statusPath;
  final Future<void> Function()? pauseVideoStatus;
  const StatusActions({
    super.key,
    required this.statusPath,
    this.pauseVideoStatus,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Widget> actions = [];

    // Insert Save status action
    final String saveStatusPath = getSavedStatusPath(statusPath);
    if (saveStatusPath.compareTo(statusPath) != 0) {
      actions.add(FloatingActionButton.extended(
        heroTag: null,
        onPressed: () async {
          ref.read(savedStatusesProvider.notifier).saveStatus(statusPath);
          showToast(getMessage: () => context.l10n.statusSavedMessage);
        },
        icon: const Icon(Icons.file_download_rounded),
        label: Text(context.l10n.saveButtonLabel),
      ));
    }

    actions.addAll([
      // Insert Share status action
      FloatingActionButton.extended(
        heroTag: null,
        onPressed: () async {
          if (statusPath.endsWith(".mp4") && pauseVideoStatus != null) {
            await pauseVideoStatus!();
          }
          final res = await Share.shareXFiles(
            [XFile(statusPath)],
            subject: 'Whatsapp Status',
          );
          consoleLog(res, "result");
        },
        icon: const Icon(Icons.share_rounded),
        label: Text(context.l10n.shareButtonLabel),
      )
    ]);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: actions,
    );
  }
}

class DeleteSavedStatusAction extends ConsumerWidget {
  const DeleteSavedStatusAction(
      {super.key, required this.statusPath, this.onPressed});
  final String statusPath;
  final void Function(Future<bool?> Function() deleteStatus)? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: onPressed != null
          ? () => onPressed!(() => deleteStatus(context, ref))
          : () => deleteStatus(context, ref),
      icon: const Icon(
        Icons.delete_forever,
        color: Colors.white,
      ),
    );
  }

  Future<bool?> deleteStatus(BuildContext context, WidgetRef ref) =>
      showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: Text(context.l10n.deleteStatusWarningTitle),
          content: Text(
            context.l10n.deleteStatusWarningMessage,
            style: const TextStyle(fontSize: 18),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(context.l10n.cancelButtonLabel),
            ),
            TextButton(
              onPressed: () {
                ref
                    .read(savedStatusesProvider.notifier)
                    .deleteStatus(statusPath)
                    .then((isDeleted) {
                  Navigator.pop(context);
                  if (isDeleted) {
                    Navigator.pop(context);
                    showToast(
                      message: context.l10n.deletedStatusMessage,
                    );
                  } else {
                    showToast(
                      message: "was not able to delete",
                    );
                  }
                });
              },
              child: Text(context.l10n.deleteButtonLabel),
            ),
          ],
        ),
      );
}
