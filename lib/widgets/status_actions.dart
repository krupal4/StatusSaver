import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:status_saver/common.dart';
import 'package:status_saver/screens/home_screen.dart';
import 'package:status_saver/services/show_without_ui_block_message.dart';

class StatusActions extends ConsumerWidget {
  final String statusPath;
  const StatusActions({super.key, required this.statusPath});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Widget> actions = [];

    // Insert Save status action
    final String saveStatusPath = getSavedStatusPath(statusPath);
    if (saveStatusPath.compareTo(statusPath) != 0) {
      actions.add(FloatingActionButton.extended(
        heroTag: "Save status",
        onPressed: () {
          try {
            File(saveStatusPath)
                .create(recursive: true)
                .then((value) => File(statusPath).copy(saveStatusPath))
                .then((value) {
              showMessageWithoutUiBlock(
                  message: AppLocalizations.of(context)?.statusSavedMessage ??
                      "Status successfully saved");
              ref.read(savedStatusesProvider.notifier).add(saveStatusPath);
            });
          } catch (e) {
            log("save ::: $e");
          }
        },
        icon: const Icon(Icons.file_download_rounded),
        label: Text(AppLocalizations.of(context)?.saveButtonLabel ?? "Save"),
      ));
    }

    actions.addAll([
      // Insert Share status action
      FloatingActionButton.extended(
        heroTag: "Share status",
        onPressed: () {
          Share.shareFiles([statusPath],
              subject:
                  'Whatsapp Status'); // FIXME: notification bar getting close (screen height changing issue)
        },
        icon: const Icon(Icons.share_rounded),
        label: Text(AppLocalizations.of(context)?.shareButtonLabel ?? "Share"),
      )
    ]);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: actions,
    );
  }
}

class DeleteAction extends ConsumerWidget {
  final String statusPath;
  const DeleteAction({super.key, required this.statusPath});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: const Text(
                "Do you want to permanently delete this status ?"), // TODO: localize
            actions: [
              TextButton(
                  onPressed: () {
                    pop(context);
                  },
                  child: const Text('CANCEL')), // TODO: localize
              TextButton(
                  onPressed: () {
                    ref.read(savedStatusesProvider.notifier).remove(statusPath);
                    pop(context);
                    pop(context);
                    showMessageWithoutUiBlock(message: "Status deleted"); // TODO: localize
                  },
                  child: const Text('DELETE')), // TODO: localize
            ],
          ),
        );
      },
      icon: const Icon(Icons.delete_forever, color: Colors.white,),
    );
  }
}
