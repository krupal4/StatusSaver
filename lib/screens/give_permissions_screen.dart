import 'package:provider/provider.dart';
import 'package:status_saver/common.dart';
import 'package:status_saver/provider/storage_permission_provider.dart';
import 'package:status_saver/widgets/my_drawer.dart';

class GivePermissionsScreen extends StatelessWidget {
  const GivePermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {    
    final storagePermissionProvider = Provider.of<StoragePermissionProvider>(context);
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
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "You need to give storage permissions for Status Saver application.", // TODO: localize and give better message using GPT
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18)
            ),
          ),
          ElevatedButton(
            child: const Text("Give Storage Permission"), // TODO: localize
            onPressed: () {
              storagePermissionProvider.requestAndHandle();
            },
          ),
        ],
      ),
    );
  }
}