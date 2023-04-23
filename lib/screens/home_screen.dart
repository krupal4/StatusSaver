import 'package:status_saver/constants.dart';
import 'package:status_saver/screens/recent_screen.dart';
import 'package:status_saver/services/get_statuses.dart';
import 'package:status_saver/services/is_directory_exists.dart';
import 'package:status_saver/widgets/drawer_item.dart';
import 'package:status_saver/screens/saved_screen.dart';
import 'package:status_saver/common.dart';
import 'package:status_saver/widgets/do_or_die.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const numOfTabs = 2;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late Future<bool> _recentDirectoryExists;
  late Future<bool> _savedDirectoryExists;

  late Future<List<String>> _recentStatuses;
  late Future<List<String>> _savedStatuses;

  @override
  void initState() {
    super.initState();

    // for recent statuses
    _recentDirectoryExists = isDirectoryExists(directoriesPath:recentDirectoryPaths)
    .then((isExists) {
      if(isExists) {
        _recentStatuses = getStatuses(directoryPaths : recentDirectoryPaths); 
        return true;
      }
      return false;
    });

    // for saved statuses
    _savedDirectoryExists = isDirectoryExists(directoriesPath:savedDirectoryPaths)
    .then((isExists) {
      if(isExists) {
        _savedStatuses = getStatuses(directoryPaths: savedDirectoryPaths);
        return true;
      }
      return false;
    });

  }

  @override
  Widget build(BuildContext context) {
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
                directoryExists: _recentDirectoryExists,
                notExistsMessage: AppLocalizations.of(context)?.noWhatsappFoundMessage ?? "Whatsapp or W4B Not found",
                onExists:() => RecentScreen(statuses: _recentStatuses),
              ),
              DoOrDie(
                directoryExists: _savedDirectoryExists,
                notExistsMessage: AppLocalizations.of(context)?.noSavedStatusesMessage ?? "No saved statuses",
                onExists:() => SavedScreen(statuses: _savedStatuses),
              )
            ],
        ),
      ),
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