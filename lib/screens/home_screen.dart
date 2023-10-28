import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:status_saver/common.dart';
import 'package:status_saver/widgets/my_drawer.dart';
import 'package:status_saver/widgets/recent_statuses.dart';
import 'package:status_saver/widgets/saved_statuses.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  static const numOfTabs = 2;

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late TabController _tabController;
  String shortcut = 'no action set';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _tabController = TabController(vsync: this, length: HomeScreen.numOfTabs);
    initQuickActions();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
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
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showExitConfirmDialog(context);
        return shouldPop ?? false;
      },
      child: Scaffold(
              appBar: AppBar(
                title: Text(context.l10n.appTitle),
                elevation: 4,
                centerTitle: true,
                bottom: TabBar(
                  controller: _tabController,
                  tabs: [
                    MyTab(tabName: context.l10n.recentStatuses),
                    MyTab(tabName: context.l10n.savedStatuses),
                  ],
                ),
              ),
              drawer: const MyDrawer(),
              body: TabBarView(
                controller: _tabController,
                children: const [
                  RecentStatuses(),
                  SavedStatuses(),
                ],
              ),
            ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      ref.read(recentStatusesProvider.notifier).refresh();
      ref.read(savedStatusesProvider.notifier).refresh();
    }
  }

  static Future<bool?> showExitConfirmDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(context.l10n.cancelButtonLabel),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, true);
              SystemNavigator.pop();
            },
            child: Text(context.l10n.exitButtonLabel),
          ),
        ],
        title: Text(context.l10n.exitWarningTitle),
        content: Text(
          context.l10n.exitWarningMessage,
          style: const TextStyle(fontSize: 18),
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
      child: Text(
        tabName,
        style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
      ),
    );
  }
}
