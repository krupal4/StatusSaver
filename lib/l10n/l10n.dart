import 'package:status_saver/common.dart';

class L10n {

  static final supportedLanguageCodes = [
    'system',
    'en',
    'hi',
    'gu',
  ];

  static final allSupportedLocales = supportedLanguageCodes.map((languageCode) => Locale(languageCode)).toList();

  static String? getLanguageName(String languageCode, BuildContext context) {
    switch(languageCode) {
      case 'system': return AppLocalizations.of(context)?.systemDefaultLabel ?? "System Default";
      case 'en': return "English";
      case 'hi': return "हिंदी";
      case 'gu': return "ગુજરાતી";
    }
    return null;
  }
}