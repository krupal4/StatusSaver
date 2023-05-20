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
              ??"App Language",),
            leading: const Icon(Icons.translate),
            onTap: () {
              pop(context);
              _showLanguageChooser(context);
            },
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)?.appThemeModeLabel ?? "App Theme Mode"),
            leading: const Icon(Icons.dark_mode_outlined),
            onTap: () {
              pop(context);
              _showThemeModeSelector(context);
            },
          ),
          ListTile(
            title:  Text(AppLocalizations.of(context)?.aboutButtonLabel ?? "About"),
            leading: const Icon(Icons.info),
            onTap: () {
              pop(context);
              showAboutDialog(
                context: context,
                applicationIcon: applicationIcon,
                applicationVersion: applicationVersion,
                applicationName: applicationName(context),
                children: [
                  Text(AppLocalizations.of(context)?.howDoesItWorkTitle ?? "How does it work?",style: const TextStyle(fontSize: 22),),
                  Text(AppLocalizations.of(context)?.howDoesItWorkDescription ?? "We are not affiliated or officially connected with WhatsApp Inc in any way. And, we do not have any access to your WhatsApp messages.\n\nThis application is intended to provide you with a more convenient way to explore, save and share the status images and videos cached in your device storage",style: const TextStyle(fontSize: 18),)
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
        final themeModeProvider = context.watch<ThemeModeProvider>();
        return AlertDialog(
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.22,// FIXME: give auto height
            width: MediaQuery.of(context).size.width * 0.7,
            child: Scrollbar(
              child: Padding(
                padding: const EdgeInsets.only(right: 12,),
                child: ListView.builder(
                  itemCount: MyThemes.themeModeTypes(context).length,
                  itemBuilder: (context,index) {
                    return ListTile(
                      title: Text(MyThemes.themeModeTypes(context)[index]),
                      leading: MyThemes.themeModeIcons[index],
                      trailing: themeModeProvider.themeMode == MyThemes.themeModes[index] ? const Icon(Icons.check): null,
                      onTap: () {
                        themeModeProvider.setThemeMode(MyThemes.themeModes[index], context);
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
              child: Text(AppLocalizations.of(context)?.closeButtonLabel ?? "CLOSE")
            )
          ],
        );
      }
    );
  }

  void _showLanguageChooser(BuildContext context) {
    final localeProvider = context.watch<LocaleProvider>();
    LanguageCode tempSelectedLanguageCode = localeProvider.locale?.languageCode.toLanguageCode() ?? systemLanguageCode;
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
                height: double.maxFinite, // FIXME: give auto height
                width: MediaQuery.of(context).size.width * 0.85,
                child: Scrollbar(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12,),
                    child: ListView.builder(
                      itemCount: LanguageCode.values.length,
                      itemBuilder: (context,index) {
                        final LanguageCode languageCode = LanguageCode.values[index];
                        return RadioListTile(
                          value: LanguageCode.values[index], 
                          groupValue: tempSelectedLanguageCode, 
                          onChanged: (value) {
                            setState((){tempSelectedLanguageCode=value!;});
                          },
                          title: Text('${L10n.getLanguageName(languageCode, context)} ${languageCode != systemLanguageCode ? "[${languageCode.name}]" : emptyString}')
                        );
                      },
                    ),
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => pop(context), 
                  child: Text(AppLocalizations.of(context)?.cancelButtonLabel ?? "CANCEL"),
                ),
                TextButton(
                  onPressed: () {
                    pop(context);
                    localeProvider.setLocale(tempSelectedLanguageCode, context);
                  }, 
                  child: Text(AppLocalizations.of(context)?.okButtonLabel ?? "OK"),
                ),
              ],
            );
          }
        );
    });
  }
}