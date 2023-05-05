import 'package:status_saver/constants.dart';
import 'package:status_saver/services/get_statuses.dart';
import 'package:status_saver/services/get_storage_permissions.dart';
import 'package:status_saver/services/is_directory_exists.dart';
import 'package:status_saver/widgets/drawer_item.dart';
import 'package:status_saver/screens/give_permissions_screen.dart';
import 'package:status_saver/common.dart';
import 'package:status_saver/widgets/do_or_die.dart';
import 'package:status_saver/widgets/statuses_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const numOfTabs = 2;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Future<List<String>>? recentStatuses;
  Future<List<String>>? savedStatuses;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getStoragePermissions(),
      builder: (context,snapshot) {
        if(snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator(),);
        } else if(snapshot.data == false) {
          return const GivePermissionsScreen();
        }
        return DefaultTabController(
          length: HomeScreen.numOfTabs, 
          child: Scaffold(
            appBar: AppBar(
              title: Text(AppLocalizations.of(context)?.appTitle ?? "WhatsApp Status Saver"),
              centerTitle: true,
              bottom: TabBar(
                splashBorderRadius: BorderRadius.circular(10),
                tabs: [
                  MyTab(tabName: AppLocalizations.of(context)?.recentStatuses ?? "Recent"),
                  MyTab(tabName: AppLocalizations.of(context)?.savedStatuses ?? "Saved"),
              ]),
              ),
            drawer:Drawer(
              child: Column(
                children: [
                  const DrawerHeader(
                    child: Text('Hello')
                  ),
                  DrawerItem(
                    child: Row(
                      children: [
                        const Icon(Icons.language_sharp),
                        Text(AppLocalizations.of(context)?.appLanguageLabel ?? "App Language"),
                      ],
                    ),
                  )
                ],
              ),
            ),
            body: TabBarView(
              children: [
                  DoOrDie(
                    directoryExists: () => isDirectoryExists(directoriesPath: recentDirectoryPaths),
                    notExistsMessage: AppLocalizations.of(context)?.noWhatsappFoundMessage ?? "Whatsapp or W4B Not found",
                    onExists:() => StatusesList(statuses: recentStatuses,getStatuses: () => getStatuses(directoryPaths: recentDirectoryPaths),tabName: "Recent"),
                  ),
                  DoOrDie(
                    directoryExists: () => isDirectoryExists(directoriesPath: [savedStatusesDirectory]),
                    notExistsMessage: AppLocalizations.of(context)?.noSavedStatusesMessage ?? "No saved statuses",
                    onExists:() => StatusesList(statuses: savedStatuses,getStatuses: () => getStatuses(directoryPaths: [savedStatusesDirectory])),
                  )
                ],
            ),
          ),
        );
      }
    );
  }
}

class MyTab extends StatelessWidget {
  final String tabName;
  const MyTab({super.key, required this.tabName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(tabName, style: const TextStyle(fontSize: 19,fontWeight: FontWeight.w400))
    );
  }
}