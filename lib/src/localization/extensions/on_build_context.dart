import 'package:flutter/widgets.dart';
import 'package:status_saver/src/localization/extensions/on_build_context.dart';
export 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension LocalizationsContext on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
