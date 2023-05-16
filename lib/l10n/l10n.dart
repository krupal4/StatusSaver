import "package:flutter/foundation.dart";
import "package:status_saver/common.dart";

enum LanguageCode {
  system,
  en,
  af,
  ar,
  az,
  bn,
  es,
  gu,
  hi,
  ja,
  kn,
  ko,
  mr,
  pa,
  ta,
  te,
  ur
}
class L10n {
  static final allSupportedLocales = LanguageCode.values.map((languageCode) => Locale(languageCode.name)).toList();

  static String? getLanguageName(LanguageCode languageCode, BuildContext context) {
    switch(languageCode) {
      case LanguageCode.system: return AppLocalizations.of(context)?.systemDefaultLabel ?? "System Default";
      case LanguageCode.en: return "English";
      case LanguageCode.hi: return "हिंदी";
      case LanguageCode.gu: return "ગુજરાતી";
      case LanguageCode.ko: return "한국어";
      case LanguageCode.mr: return "मराठी";
      case LanguageCode.pa: return "ਪੰਜਾਬੀ";
      case LanguageCode.ta: return "தமிழ்";
      case LanguageCode.te: return "తెలుగు";
      case LanguageCode.ja: return "日本語 (にほんご";
      case LanguageCode.af: return "Afrikaans";
      case LanguageCode.az: return "Azərbaycan dili";
      case LanguageCode.bn: return "বাংলা";     
      case LanguageCode.kn: return "ಕನ್ನಡ";    
      case LanguageCode.ur: return "اردو";    
      case LanguageCode.es: return "Español";
      case LanguageCode.ar: return "العربية";
    }
  }
}

extension LanguageCodeExtension on String {
  LanguageCode toLanguageCode() {
    return LanguageCode.values.firstWhere((element) => describeEnum(element) == this);
  }
}