
import 'dart:io';

import 'package:share_plus/share_plus.dart';
import 'package:status_saver/common.dart';
import 'package:status_saver/constants.dart';

const leadingBackIcon = Icon(Icons.arrow_back_ios_new_rounded);

List<Widget> statusActions({required BuildContext context, required String statusPath}) {
  List<Widget> actions = [];

  final String saveStatusPath = "$savedStatusesDirectory/${statusPath.split('/').last}";
  if(saveStatusPath.compareTo(statusPath)!=0) {
    actions.add(IconButton(
      onPressed: (){
        try
        {
          File(saveStatusPath).create(recursive: true)
          .then((value) => File(statusPath).copy(saveStatusPath))
          .then((value) {
            ScaffoldMessenger.of(context)
            .showSnackBar(
              SnackBar(content: Text(AppLocalizations.of(context)?.statusSavedMessage ?? "Status successfully saved")));
          });
        } catch (e) {
          log("save ::: " + e.toString());
        }
      }, 
      icon: const Icon(Icons.file_download_rounded)
    ));
  }

  actions.addAll([
    IconButton(
      onPressed: (){
        // TODO use depricated method for share
        Share.shareXFiles([XFile(statusPath)],subject: 'WhatsappSubject');
      }, 
      icon: const Icon(Icons.share_rounded)
    ),
    const SizedBox(width: 10)
    ]);

  return actions;
}