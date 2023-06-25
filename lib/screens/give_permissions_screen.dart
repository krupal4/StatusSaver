import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:status_saver/common.dart';
import 'package:status_saver/screens/home_screen.dart';
import 'package:status_saver/widgets/my_drawer.dart';

class GivePermissionsScreen extends ConsumerWidget {
  const GivePermissionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storagePermissionNotifier =
        ref.watch(storagePermissionProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        elevation: 3.5,
        title: Text(context.l10n.appTitle),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
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
              storagePermissionNotifier.requestAndHandle(context);
            },
          ),
        ],
      ),
    );
  }
}
