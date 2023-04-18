import 'package:status_saver/screens/recent_screen.dart';
import 'package:status_saver/screens/saved_screen.dart';

import '../common.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const numOfTabs = 2;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: HomeScreen.numOfTabs, 
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)?.appTitle ?? "WhatsApp Status Saver"),
          bottom: TabBar(
            tabs: [
              MyTab(tabName: AppLocalizations.of(context)?.recentStatuses ?? "Recent"),
              MyTab(tabName: AppLocalizations.of(context)?.savedStatuses ?? "Saved"),
          ]),
          ),
        body: const TabBarView(
          children: [
              RecentScreen(),
              SavedScreen()
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
      child: Text(tabName),
    );
  }
}