import 'package:shared_preferences/shared_preferences.dart';
import 'package:status_saver/common.dart';
import 'package:status_saver/constants.dart';
import 'package:status_saver/l10n/l10n.dart';
import 'package:status_saver/services/show_without_ui_block_message.dart';

class LocaleProvider extends ChangeNotifier {
  Locale? _locale;

  void initialize() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final languageCode = sharedPreferences.getString(languageCodeKey);
    if(languageCode != null && languageCode != systemLanguageCode) {
      _locale = Locale(languageCode);
      notifyListeners();
    }
  }

  Locale? get locale => _locale;

  void setLocale(String languageCode) {
    if(!L10n.supportedLanguageCodes.contains(languageCode)) return;

    _locale = languageCode == systemLanguageCode ? null : Locale(languageCode);
    SharedPreferences.getInstance().then((sharedPreferences) {
      sharedPreferences.setString(languageCodeKey,languageCode)
      .then((value) {
        if(!value) {
          showMessageWithoutUiBlock(message: 'Could not save your language preference'); // TODO: localize
        }
      });
    });

    notifyListeners();
  } 
}