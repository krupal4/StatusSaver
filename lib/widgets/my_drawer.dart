import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:status_saver/app_info.dart';
import 'package:status_saver/common.dart';
import 'package:status_saver/constants.dart';
import 'package:status_saver/notifiers/theme_mode_notifier.dart';

class MyDrawer extends ConsumerWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      elevation: 2.5,
      child: ListView(
        children: [
          ListTile(
            title: Text(context.l10n.appLanguageLabel),
            leading: const Icon(Icons.translate),
            onTap: () {
              pop(context);
              _showLanguageChooser(context, ref);
            },
          ),
          ListTile(
            title: Text(context.l10n.appThemeModeLabel),
            leading: const Icon(Icons.dark_mode_outlined),
            onTap: () {
              pop(context);
              _showThemeModeSelector(context, ref);
            },
          ),
          ListTile(
            title: Text(context.l10n.aboutButtonLabel),
            leading: const Icon(Icons.info),
            onTap: () {
              pop(context);
              showAboutDialog(
                  context: context,
                  applicationIcon: applicationIcon,
                  applicationVersion: applicationVersion,
                  applicationName: applicationName(context),
                  children: [
                    Text(
                      context.l10n.howDoesItWorkTitle,
                      style: const TextStyle(fontSize: 22),
                    ),
                    Text(
                      context.l10n.howDoesItWorkDescription,
                      style: const TextStyle(fontSize: 18),
                    )
                  ]);
            },
          ),
        ],
      ),
    );
  }

  Future<dynamic> _showThemeModeSelector(BuildContext context, WidgetRef ref) {
    return showDialog(
        context: context,
        builder: (context) {
          final themeModeNotifier = ref.watch(themeModeProvider.notifier);
          return AlertDialog(
            content: SizedBox(
              height: MediaQuery.of(context).size.height *
                  0.22, // FIXME: give auto height
              width: MediaQuery.of(context).size.width * 0.7,
              child: Scrollbar(
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 12,
                  ),
                  child: ListView.builder(
                    itemCount: MyThemes.themeModeTypes(context).length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(MyThemes.themeModeTypes(context)[index]),
                        leading: MyThemes.themeModeIcons[index],
                        trailing: themeModeNotifier.themeMode ==
                                MyThemes.themeModes[index]
                            ? const Icon(Icons.check)
                            : null,
                        onTap: () {
                          themeModeNotifier.setThemeMode(
                              MyThemes.themeModes[index], context);
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
                  child: Text(context.l10n.closeButtonLabel))
            ],
          );
        });
  }

  void _showLanguageChooser(BuildContext context, WidgetRef ref) {
    final localeProviderNotifier = ref.watch(localeProvider.notifier);
    LanguageCode tempSelectedLanguageCode =
        localeProviderNotifier.locale?.languageCode.toLanguageCode() ??
            systemLanguageCode;
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              contentPadding: const EdgeInsets.only(top: 4),
              title: Text(context.l10n.appLanguageLabel,
                  style: const TextStyle(fontSize: 18)),
              content: SizedBox(
                height: double.maxFinite, // FIXME: give auto height
                width: MediaQuery.of(context).size.width * 0.85,
                child: Scrollbar(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 12,
                    ),
                    child: ListView.builder(
                      itemCount: LanguageCode.values.length,
                      itemBuilder: (context, index) {
                        final LanguageCode languageCode =
                            LanguageCode.values[index];
                        return RadioListTile(
                            value: LanguageCode.values[index],
                            groupValue: tempSelectedLanguageCode,
                            onChanged: (value) {
                              setState(() {
                                tempSelectedLanguageCode = value!;
                              });
                            },
                            title: Text(
                                '${L10n.getLanguageName(languageCode, context)} ${languageCode != systemLanguageCode ? "[${languageCode.name}]" : emptyString}'));
                      },
                    ),
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => pop(context),
                  child: Text(context.l10n.cancelButtonLabel),
                ),
                TextButton(
                  onPressed: () {
                    pop(context);
                    localeProviderNotifier.setLocale(
                        tempSelectedLanguageCode, context);
                  },
                  child: Text(context.l10n.okButtonLabel),
                ),
              ],
            );
          });
        });
  }
}
