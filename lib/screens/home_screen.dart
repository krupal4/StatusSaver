import 'package:provider/provider.dart';
import 'package:status_saver/app_info.dart';
import 'package:status_saver/common.dart';
import 'package:status_saver/l10n/l10n.dart';
import 'package:status_saver/models/tab_type.dart';
import 'package:status_saver/provider/locale_provider.dart';
import 'package:status_saver/screens/give_permissions_screen.dart';
import 'package:status_saver/services/get_storage_permissions.dart';
import 'package:status_saver/widgets/do_or_die.dart';
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
    return FutureBuilder(
        future: getStoragePermissions(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data == false) {
            return const GivePermissionsScreen();
          }
          return DefaultTabController(
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
              drawer: _buildDrawer(context),
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
          );
        });
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      elevation: 2.5,
      child: ListView(
        children: [
          ListTile(
            title:  Text(AppLocalizations.of(context)?.appLanguageLabel 
              ??"App Language"),
            leading: const Icon(Icons.translate),
            onTap: () {
              pop(context);
              _showLanguageChooser(context);
            },
          ),
          ListTile(
            title:  const Text("About"), // TODO: localize
            leading: const Icon(Icons.info),
            onTap: () {
              pop(context);
              showAboutDialog(
                context: context,
                applicationIcon: applicationIcon,
                applicationVersion: applicationVersion,
                applicationName: applicationName,
                children: const [
                  Text("How does it work?",style: TextStyle(fontSize: 22),), // TODO:
                  Text("We are not affiliated or officially connected with WhatsApp Inc in any way. And, we do not have any access to your WhatsApp messages.\n\nThis application is intended to provide you with a more convenient way to explore, save and share the status images and videos cached in your device storage",style: TextStyle(fontSize: 18),) //TODO:
                ]
              );
            },
          ),
        ],
      ),
    );
  }

  void _showLanguageChooser(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context, listen: false);
    String tempSelectedLanguageCode = localeProvider.locale.languageCode;
    showDialog(
      context: context, 
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              contentPadding: const EdgeInsets.only(top: 4),
              title: Text(
                AppLocalizations.of(context)?.appLanguageLabel ?? "App Language",
                style: const TextStyle(fontSize: 18)
              ),
              content: SizedBox(
                height: double.maxFinite,
                width: MediaQuery.of(context).size.width * 0.7,
                child: Scrollbar(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12,),
                    child: ListView.builder(
                      itemCount: L10n.supportedLanguageCodes.length,
                      itemBuilder: (context,index) {
                        final String languageCode = L10n.supportedLanguageCodes[index];
                        return RadioListTile(
                          value: languageCode, 
                          groupValue: tempSelectedLanguageCode, 
                          onChanged: (value) {
                            setState((){tempSelectedLanguageCode=value!;});
                          },
                          title: Text('${L10n.getLanguageName(languageCode)} [$languageCode]')
                        );
                      },
                    ),
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => pop(context), 
                  child: const Text("CANCEL"),  // TODO:
                ),
                TextButton(
                  onPressed: () {
                    pop(context);
                    localeProvider.setLocale(tempSelectedLanguageCode);
                  }, 
                  child: const Text("OK"), // TODO:
                ),
              ],
            );
          }
        );
    });
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
