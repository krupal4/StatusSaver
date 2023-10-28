import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:status_saver/common.dart';
import 'package:status_saver/models/tab_type.dart';
import 'package:status_saver/screens/give_permissions_screen.dart';
import 'package:status_saver/widgets/statuses_list.dart';

class SavedStatuses extends ConsumerWidget {
  const SavedStatuses({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return FutureBuilder(
        future: ref.read(savedStatusesProvider.notifier).isStoragePermitted,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return (snapshot.data ?? false)
              ? const StatusesList(tabType: TabType.saved)
              : const GivePermissionsScreen(tabType: TabType.saved);
        });
    /*
    return FutureBuilder(
        future: isDirectoryExists(tabType: tabType),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data!) {
              return StatusesList(tabType: tabType);
            }
            return NotFoundScreen(
                message: tabType == TabType.recent
                    ? context.l10n.noWhatsappFoundMessage
                    : context.l10n.noSavedStatusesMessage);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });

    */
  }
}
