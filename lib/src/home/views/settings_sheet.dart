import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:status_saver/src/common/helpers/app_haptics.dart';
import 'package:status_saver/src/common/views/brand_icon.dart';
import 'package:status_saver/src/localization/enums/language_code.dart';
import 'package:status_saver/src/localization/extensions/on_build_context.dart';
import 'package:status_saver/src/localization/extensions/on_string.dart';
import 'package:status_saver/src/localization/l10n/l10n.dart';
import 'package:status_saver/src/localization/notifiers/locale_notifier.dart';
import 'package:status_saver/src/theme/notifiers/theme_mode_notifier.dart';
import 'package:status_saver/src/theme/tokens.dart';

const String applicationVersion = "1.0.0";

Future<void> showSettingsSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (context) => const SettingsSheet(),
  );
}

class SettingsSheet extends ConsumerWidget {
  const SettingsSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final l10n = context.l10n;
    final ThemeMode currentMode =
        ref.watch(themeModeProvider) ?? ThemeMode.system;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          0,
          AppSpacing.md,
          AppSpacing.lg,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.settingsTitle, style: textTheme.headlineMedium),
            const SizedBox(height: AppSpacing.md),
            Text(l10n.themeSectionLabel, style: textTheme.labelMedium),
            const SizedBox(height: AppSpacing.xs),
            SizedBox(
              width: double.infinity,
              child: SegmentedButton<ThemeMode>(
                showSelectedIcon: false,
                segments: [
                  ButtonSegment(
                    value: ThemeMode.system,
                    label: Text(l10n.systemThemeLabel),
                    icon: const Icon(Icons.brightness_auto_rounded),
                  ),
                  ButtonSegment(
                    value: ThemeMode.light,
                    label: Text(l10n.lightThemeLabel),
                    icon: const Icon(Icons.light_mode_rounded),
                  ),
                  ButtonSegment(
                    value: ThemeMode.dark,
                    label: Text(l10n.darkThemeLabel),
                    icon: const Icon(Icons.dark_mode_rounded),
                  ),
                ],
                selected: {currentMode},
                onSelectionChanged: (selection) {
                  AppHaptics.selection();
                  ref
                      .read(themeModeProvider.notifier)
                      .setThemeMode(selection.first, context);
                },
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.translate_rounded),
              title: Text(l10n.languageSectionLabel),
              subtitle: Text(
                L10n.getLanguageName(
                      ref.watch(localeProvider)?.languageCode.toLanguageCode() ??
                          systemLanguageCode,
                      context,
                    ) ??
                    l10n.systemDefaultLabel,
              ),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () {
                Navigator.of(context).pop();
                showLanguageSheet(context, ref);
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.info_outline_rounded),
              title: Text(l10n.aboutButtonLabel),
              onTap: () {
                Navigator.of(context).pop();
                showAboutDialog(
                  context: context,
                  applicationIcon: const BrandIcon(size: 44),
                  applicationVersion: applicationVersion,
                  applicationName: l10n.appTitle,
                  children: [
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      l10n.howDoesItWorkTitle,
                      style: textTheme.titleLarge,
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(l10n.howDoesItWorkDescription),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> showLanguageSheet(BuildContext context, WidgetRef ref) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (context) => const LanguageSheet(),
  );
}

class LanguageSheet extends ConsumerStatefulWidget {
  const LanguageSheet({super.key});

  @override
  ConsumerState<LanguageSheet> createState() => _LanguageSheetState();
}

class _LanguageSheetState extends ConsumerState<LanguageSheet> {
  late LanguageCode _selected;

  @override
  void initState() {
    super.initState();
    _selected = ref.read(localeProvider)?.languageCode.toLanguageCode() ??
        systemLanguageCode;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final double maxHeight = MediaQuery.sizeOf(context).height * 0.7;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.xs,
          0,
          AppSpacing.xs,
          AppSpacing.md,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.sm,
                0,
                AppSpacing.sm,
                AppSpacing.xs,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  l10n.appLanguageLabel,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: maxHeight - 120),
              child: RadioGroup<LanguageCode>(
                groupValue: _selected,
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() => _selected = value);
                },
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: LanguageCode.values.length,
                  itemBuilder: (context, index) {
                    final LanguageCode languageCode =
                        LanguageCode.values[index];
                    final String name =
                        L10n.getLanguageName(languageCode, context) ??
                            languageCode.name;
                    final String title = languageCode == systemLanguageCode
                        ? name
                        : '$name [${languageCode.name}]';
                    return RadioListTile<LanguageCode>(
                      value: languageCode,
                      title: Text(title),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.sm,
                AppSpacing.xs,
                AppSpacing.sm,
                0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(l10n.cancelButtonLabel),
                  ),
                  FilledButton(
                    onPressed: () {
                      ref
                          .read(localeProvider.notifier)
                          .setLocale(_selected, context);
                      AppHaptics.selection();
                      Navigator.of(context).pop();
                    },
                    child: Text(l10n.okButtonLabel),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

