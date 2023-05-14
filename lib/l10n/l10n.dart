import 'package:status_saver/common.dart';

class L10n {

  static final supportedLanguageCodes = [
    'system',
    'en',
    'hi',
    'gu',
  ];

  static final allSupportedLocales = supportedLanguageCodes.map((languageCode) => Locale(languageCode)).toList();

  static String? getLanguageName(String languageCode) {
    switch(languageCode) {
      case 'system': return "System Default"; // TODO: localize
      case 'en': return "English";
      case 'hi': return "हिंदी";
      case 'gu': return "ગુજરાતી";
    }
    return null;
  }
}