import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:status_saver/common.dart';
import 'package:status_saver/constants.dart';
import 'package:status_saver/services/show_toast.dart';

class LocaleNotifier extends StateNotifier<Locale?> {
  LocaleNotifier(): super(null);

  Future<void> initialize() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final String? languageCode = sharedPreferences.getString(languageCodeKey);
    if(languageCode != null && languageCode.toLanguageCode() != systemLanguageCode) {
      state = Locale(languageCode);
    }
  }

  Locale? get locale => state;

  void setLocale(LanguageCode languageCode, BuildContext context) {
    if(!LanguageCode.values.contains(languageCode)) return;

    state = languageCode == systemLanguageCode ? null : Locale(languageCode.name);
    SharedPreferences.getInstance().then((sharedPreferences) {
      sharedPreferences.setString(languageCodeKey,languageCode.name)
      .then((value) {
        if(!value) {
          showToast(message: context.l10n.couldNotSaveYourLanguagePreference);
        }
      });
    });
  } 
}