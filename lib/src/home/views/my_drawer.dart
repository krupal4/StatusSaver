import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:status_saver/src/localization/enums/language_code.dart';
import 'package:status_saver/src/localization/extensions/on_build_context.dart';
import 'package:status_saver/src/localization/extensions/on_string.dart';
import 'package:status_saver/src/localization/l10n/l10n.dart';
import 'package:status_saver/src/localization/notifiers/locale_notifier.dart';
import 'package:status_saver/src/theme/notifiers/theme_mode_notifier.dart';

// TODO: re visit this
const String applicationVersion = "1.0.0";
String applicationName(BuildContext context) => context.l10n.appTitle;

Icon applicationIcon =
    const Icon(FontAwesomeIcons.squareVirus); // TODO: provide application icon

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
              Navigator.of(context).pop();
              _showLanguageChooser(context, ref);
            },
          ),
          ListTile(
            title: Text(context.l10n.appThemeModeLabel),
            leading: const Icon(Icons.dark_mode_outlined),
            onTap: () {
              Navigator.of(context).pop();
              _showThemeModeSelector(context, ref);
            },
          ),
          ListTile(
            title: Text(context.l10n.aboutButtonLabel),
            leading: const Icon(Icons.info),
            onTap: () {
              Navigator.of(context).pop();
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
                    Navigator.of(context).pop();
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
                                '${L10n.getLanguageName(languageCode, context)} ${languageCode != systemLanguageCode ? "[${languageCode.name}]" : ""}'));
                      },
                    ),
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(context.l10n.cancelButtonLabel),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
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
