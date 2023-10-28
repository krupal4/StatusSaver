import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:status_saver/common.dart';
import 'package:status_saver/models/tab_type.dart';
import 'package:status_saver/notifiers/recent_statuses_notifier.dart';
import 'package:status_saver/screens/give_permissions_screen.dart';
import 'package:status_saver/screens/not_found_screen.dart';
import 'package:status_saver/widgets/statuses_list.dart';

class RecentStatuses extends ConsumerWidget {
  const RecentStatuses({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    RecentStatusesNotifier  recentStatusesNotifier = ref.watch(recentStatusesProvider.notifier);
    return recentStatusesNotifier.isAppExists
        ? recentStatusesNotifier.isSafPermitted 
          ? const StatusesList(tabType: TabType.recent)
          : const GivePermissionsScreen(tabType: TabType.recent)
        : NotFoundScreen(message: context.l10n.noWhatsappFoundMessage);
  }
}
