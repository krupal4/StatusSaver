import 'dart:io';

import 'package:status_saver/common.dart';
import 'package:share_plus/share_plus.dart';
import 'package:status_saver/constants.dart';
import 'package:status_saver/services/show_without_ui_block_message.dart';

class StatusActions extends StatelessWidget {
  final String statusPath;
  const StatusActions({super.key, required this.statusPath});

  @override
  Widget build(BuildContext context) {
    List<Widget> actions = [];

    // Insert Save status action
    final String saveStatusPath = "$savedStatusesDirectory/${statusPath.split('/').last}";
    if(saveStatusPath.compareTo(statusPath)!=0) {
      actions.add(FloatingActionButton.extended(
        heroTag: "Save status",
        onPressed: (){
          try
          {
            File(saveStatusPath).create(recursive: true)
            .then((value) => File(statusPath).copy(saveStatusPath))
            .then((value) {
              showMessageWithoutUiBlock(message: AppLocalizations.of(context)?.statusSavedMessage ?? "Status successfully saved");
            });
          } catch (e) {
            log("save ::: " + e.toString());
          }
        }, 
        icon: const Icon(Icons.file_download_rounded),
        label: const Text("Save"), // TODO save localize
      ));
    }

    actions.addAll([
      // Insert Share status action
      FloatingActionButton.extended(
        heroTag: "Share status",
        onPressed: (){
          Share.shareFiles([statusPath],subject: 'Whatsapp Status'); // TODO: notification bar getting close (screen height changing issue)
        }, 
        icon: const Icon(Icons.share_rounded),
        label: const Text("Share"), // TODO localize app
      )
    ]);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: actions,
    );
  }
}