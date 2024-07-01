import 'package:status_saver/src/localization/enums/language_code.dart';

extension LanguageCodeExtension on String {
  LanguageCode toLanguageCode() {
    return LanguageCode.values.firstWhere((element) => element.name == this);
  }
}
