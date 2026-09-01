import 'package:flutter/widgets.dart';
import 'package:status_saver/src/localization/l10n/app_localizations.dart';
export 'package:status_saver/src/localization/l10n/app_localizations.dart';

extension LocalizationsContext on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
