import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:status_saver/common.dart';
import 'package:status_saver/models/tab_type.dart';
import 'package:status_saver/provider/storage_permission_provider.dart';
import 'package:status_saver/screens/give_permissions_screen.dart';
import 'package:status_saver/widgets/do_or_die.dart';
import 'package:status_saver/widgets/my_drawer.dart';
import 'package:status_saver/widgets/statuses_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const numOfTabs = 2;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String>? recentStatuses;
  List<String>? savedStatuses;

  @override
  Widget build(BuildContext context) {
    final storagePermissionProvider = Provider.of<StoragePermissionProvider>(context);
    return (storagePermissionProvider.status != null && storagePermissionProvider.status == PermissionStatus.granted)
    ? DefaultTabController(
      length: HomeScreen.numOfTabs,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)?.appTitle ??
              "WhatsApp Status Saver"),
          elevation: 4,
          centerTitle: true,
          bottom: TabBar(
              splashBorderRadius: BorderRadius.circular(10),
              tabs: [
                MyTab(
                    tabName:
                        AppLocalizations.of(context)?.recentStatuses ??
                            "Recent"),
                MyTab(
                    tabName:
                        AppLocalizations.of(context)?.savedStatuses ??
                            "Saved"),
              ]),
        ),
        drawer: const MyDrawer(),
        body: TabBarView(
          children: [
            DoOrDie(
              tabType: TabType.recent,
              onExists: () => StatusesList(
                  statuses: recentStatuses, tabType: TabType.recent),
            ),
            DoOrDie(
              tabType: TabType.saved,
              onExists: () => StatusesList(
                  statuses: savedStatuses, tabType: TabType.saved),
            )
          ],
        ),
      ),
    )
    : const GivePermissionsScreen();
  }
}

class MyTab extends StatelessWidget {
  final String tabName;
  const MyTab({super.key, required this.tabName});

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      tabName,
      style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
    ));
  }
}
