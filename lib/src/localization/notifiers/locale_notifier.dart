import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:status_saver/src/localization/enums/language_code.dart';
import 'package:status_saver/src/localization/extensions/on_build_context.dart';
import 'package:status_saver/src/localization/extensions/on_string.dart';
import 'package:status_saver/src/common/helpers/show_toast.dart';

const languageCodeKey = "languageCode";
const defaultLanguageCode = "en";
const systemLanguageCode = LanguageCode.system;

// TODO: visit
// https://github.com/bizz84/localization_riverpod_flutter/blob/main/lib/src/localization/app_localizations_provider.dart
class LocaleNotifier extends StateNotifier<Locale?> {
  LocaleNotifier() : super(null);

  void initialize() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final String? languageCode = sharedPreferences.getString(languageCodeKey);
    if (languageCode != null &&
        languageCode.toLanguageCode() != systemLanguageCode) {
      state = Locale(languageCode);
    }
  }

  Locale? get locale => state;

  void setLocale(LanguageCode languageCode, BuildContext context) {
    if (!LanguageCode.values.contains(languageCode)) return;

    state =
        languageCode == systemLanguageCode ? null : Locale(languageCode.name);
    SharedPreferences.getInstance().then((sharedPreferences) {
      sharedPreferences
          .setString(languageCodeKey, languageCode.name)
          .then((value) {
        if (!value) {
          showToast(message: context.l10n.couldNotSaveYourLanguagePreference);
        }
      });
    });
  }
}

final localeProvider = StateNotifierProvider<LocaleNotifier, Locale?>(
    (ref) => LocaleNotifier()..initialize());
