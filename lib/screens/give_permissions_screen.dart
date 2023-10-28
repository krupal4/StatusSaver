import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:status_saver/common.dart';
import 'package:status_saver/models/tab_type.dart';
import 'package:status_saver/services/open_saf_permissions_dialog.dart';

class GivePermissionsScreen extends ConsumerWidget {
  const GivePermissionsScreen({super.key, required this.tabType});
  final TabType tabType;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              context.l10n
                  .needToGiveStoragePermission, // FIXME: give better message using GPT
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          ElevatedButton(
            child: Text(context.l10n.giveStoragePermission),
            onPressed: () {
              if(tabType == TabType.saved) {
              ref.read(storagePermissionProvider.notifier).requestAndHandle(context);
              } else {
                openSafPermissionsDialog(context, ref);
              }
            },
          ),
        ],
      ),
    );
  }
}
