import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:status_saver/common.dart';
import 'package:status_saver/screens/home_screen.dart';
import 'package:status_saver/widgets/my_drawer.dart';

class GivePermissionsScreen extends ConsumerWidget {
  const GivePermissionsScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {    
    final storagePermissionNotifier = ref.watch(storagePermissionProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        elevation: 3.5,
        title: Text(AppLocalizations.of(context)?.appTitle ?? "WhatsApp Status Saver"),
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
              AppLocalizations.of(context)?.needToGiveStoragePermission ??
              "You need to give storage permissions for this application.", // FIXME: give better message using GPT
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18)
            ),
          ),
          ElevatedButton(
            child: Text(AppLocalizations.of(context)?.giveStoragePermission ?? "Give Storage Permission"),
            onPressed: () {
              storagePermissionNotifier.requestAndHandle(context);
            },
          ),
        ],
      ),
    );
  }
}