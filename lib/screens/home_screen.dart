import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:status_saver/common.dart';
import 'package:status_saver/models/tab_type.dart';
import 'package:status_saver/provider/statuses_provider.dart';
import 'package:status_saver/provider/storage_permission_provider.dart';
import 'package:status_saver/screens/give_permissions_screen.dart';
import 'package:status_saver/widgets/do_or_die.dart';
import 'package:status_saver/widgets/my_drawer.dart';
import 'package:status_saver/widgets/statuses_list.dart';
import 'package:quick_actions/quick_actions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const numOfTabs = 2;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String shortcut = 'no action set';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: HomeScreen.numOfTabs);
    initQuickActions();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void initQuickActions() {
    const QuickActions quickActions = QuickActions();
    quickActions.initialize((String shortcutType) {
      if (shortcutType == "action_recent") {
        _tabController.animateTo(0);
      } else if (shortcutType == "action_saved") {
        _tabController.animateTo(1);
      }
    });

    quickActions.setShortcutItems(<ShortcutItem>[
      const ShortcutItem(
        type: 'action_saved',
        localizedTitle: "Saved",
        icon: 'saved_icon',
      ),
      const ShortcutItem(
        type: 'action_recent',
        localizedTitle: "Recent",
        icon: 'recent_icon',
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final storagePermissionProvider =
        context.watch<StoragePermissionProvider>();
    if (storagePermissionProvider.status == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    const int savedStatusesTabIndex = 1;
    late StatusesProvider recentStatusesProvider; 
    late StatusesProvider savedStatusesProvider;

    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showExitConfirmDialog(context);
        return shouldPop ?? false;
      },
      child: (storagePermissionProvider.status == PermissionStatus.granted)
          ? MultiProvider(
              providers: [
                  ChangeNotifierProvider(
                    create: (context) {
                      recentStatusesProvider = StatusesProvider()..initialize(TabType.recent);
                      return recentStatusesProvider;
                    },
                    lazy: false,
                  ),
                  ChangeNotifierProvider(
                    create: (context) {
                      savedStatusesProvider = StatusesProvider()..initialize(TabType.saved);
                      return savedStatusesProvider;
                    },
                    lazy: false,
                  ),
                ],
              builder: (context, __) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text(AppLocalizations.of(context)?.appTitle ??
                        "WhatsApp Status Saver"),
                    elevation: 4,
                    centerTitle: true,
                    bottom: TabBar(
                      controller: _tabController,
                      tabs: [
                        MyTab(
                          tabName:
                              AppLocalizations.of(context)?.recentStatuses ??
                                  "Recent",
                        ),
                        MyTab(
                          tabName:
                              AppLocalizations.of(context)?.savedStatuses ??
                                  "Saved",
                        ),
                      ],
                    ),
                    actions: _tabController.index == savedStatusesTabIndex
                        ? [
                            IconButton(
                              onPressed: () {
                                // TODO: implement delete functionality
                              },
                              icon: const Icon(Icons.delete),
                            ),
                          ]
                        : [
                            IconButton(
                                onPressed: () {
                                  // TODO: share statuses
                                },
                                icon: const Icon(Icons.share)),
                          ],
                  ),
                  drawer: const MyDrawer(),
                  body: TabBarView(
                    controller: _tabController,
                    children: [
                      DoOrDie(
                        tabType: TabType.recent,
                        onExists: () => StatusesList(
                          tabType: TabType.recent,
                          statusesProvider: recentStatusesProvider,
                        ),
                      ),
                      DoOrDie(
                        tabType: TabType.saved,
                        onExists: () => StatusesList(
                          tabType: TabType.saved,
                          statusesProvider: savedStatusesProvider,
                        ),
                      ),
                    ],
                  ),
                );
              })
          : const GivePermissionsScreen(),
    );
  }

  static Future<bool?> showExitConfirmDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: const Text("CANCEL")), // TODO: localize
                TextButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                      SystemNavigator.pop();
                    },
                    child: const Text("EXIT")), // TODO: localize
              ],
              title: const Text("Exit Warning"),
              content: const Text(
                "Are you sure you want to exit ?",
                style: TextStyle(fontSize: 18),
              ), // TODO: localize
            ));
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
