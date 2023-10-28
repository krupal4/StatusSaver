import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:status_saver/common.dart';
import 'package:status_saver/notifiers/recent_statuses_notifier.dart';

void openSafPermissionsDialog(BuildContext context, WidgetRef ref) {
  RecentStatusesNotifier recentStatusesNotifier =
      ref.read(recentStatusesProvider.notifier);

  bool? isW4bSafPermitted = recentStatusesNotifier.isW4bSafPermitted;
  bool? isWhatsappSafPermitted = recentStatusesNotifier.isWhatsappSafPermitted;
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (content) => StatefulBuilder(builder: (context, setState) {
      List<Widget> children = [];
      if (recentStatusesNotifier.isWhatsappExists) {
        children.add(ListTile(
          onTap: () {
            setState(() {
              isWhatsappSafPermitted = !(isWhatsappSafPermitted ?? false);
            });
          },
          leading: Checkbox(
            value: isWhatsappSafPermitted,
            onChanged: (value) {
              setState(() {
                isWhatsappSafPermitted = value;
              });
            },
          ),
          title: Text(context.l10n.openWhatsAppLabel),
        ));
      }
      if (recentStatusesNotifier.isW4bExists) {
        children.add(ListTile(
          onTap: () {
            setState(() {
              isWhatsappSafPermitted = !(isWhatsappSafPermitted ?? false);
            });
          },
          leading: Checkbox(
            value: isW4bSafPermitted,
            onChanged: (value) => setState(() => isW4bSafPermitted = value),
          ),
          title: Text(context.l10n.openW4BLabel),
        ));
      }
      return AlertDialog(
        actions: [
          TextButton(
            onPressed: () {
              recentStatusesNotifier.isWhatsappSafPermitted = isWhatsappSafPermitted ?? false;
              recentStatusesNotifier.isW4bSafPermitted = isW4bSafPermitted ?? false;
              pop(context);
            },
            child: Text(context.l10n.closeButtonLabel),
          ),
        ],
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      );
    }),
  );
}
