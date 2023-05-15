import 'package:provider/provider.dart';
import 'package:status_saver/app_info.dart';
import 'package:status_saver/common.dart';
import 'package:status_saver/constants.dart';
import 'package:status_saver/l10n/l10n.dart';
import 'package:status_saver/provider/locale_provider.dart';
import 'package:status_saver/provider/theme_provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
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
            title: const Text("App Theme Mode"), // TODO: localize
            leading: const Icon(Icons.dark_mode_outlined),
            onTap: () {
              pop(context);
              _showThemeModeSelector(context);
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

  Future<dynamic> _showThemeModeSelector(BuildContext context) {
    return showDialog(
      context: context, 
      builder: (context) {
        final themeModeProvider = Provider.of<ThemeModeProvider>(context, listen: false);
        return AlertDialog(
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.22,// TODO: auto height
            width: MediaQuery.of(context).size.width * 0.7,
            child: Scrollbar(
              child: Padding(
                padding: const EdgeInsets.only(right: 12,),
                child: ListView.builder(
                  itemCount: MyThemes.themeModeTypes.length,
                  itemBuilder: (context,index) {
                    return ListTile(
                      title: Text(MyThemes.themeModeTypes[index]),
                      leading: MyThemes.themeModeIcons[index],
                      trailing: themeModeProvider.themeMode == MyThemes.themeModes[index] ? const Icon(Icons.check): null,
                      onTap: () {
                        themeModeProvider.setThemeMode(MyThemes.themeModes[index]);
                      },
                    );
                  },
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                pop(context);
              }, 
              child: const Text("CLOSE") // TODO: localize
            )
          ],
        );
      }
    );
  }

  void _showLanguageChooser(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context, listen: false);
    String tempSelectedLanguageCode = localeProvider.locale?.languageCode ?? systemLanguageCode;
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
                height: double.maxFinite, // TODO: auto height
                width: MediaQuery.of(context).size.width * 0.85,
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
                          title: Text('${L10n.getLanguageName(languageCode)} ${languageCode != systemLanguageCode ? "[$languageCode]" : emptyString}')
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