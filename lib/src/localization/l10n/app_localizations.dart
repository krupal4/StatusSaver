import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_af.dart';
import 'app_localizations_ar.dart';
import 'app_localizations_az.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_gu.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_kn.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_mr.dart';
import 'app_localizations_pa.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_te.dart';
import 'app_localizations_ur.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('af'),
    Locale('ar'),
    Locale('az'),
    Locale('bn'),
    Locale('en'),
    Locale('es'),
    Locale('gu'),
    Locale('hi'),
    Locale('ja'),
    Locale('kn'),
    Locale('ko'),
    Locale('mr'),
    Locale('pa'),
    Locale('ta'),
    Locale('te'),
    Locale('ur')
  ];

  /// No description provided for @helloWorld.
  ///
  /// In en, this message translates to:
  /// **'Hello World!'**
  String get helloWorld;

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Status Saver'**
  String get appTitle;

  /// No description provided for @recentStatuses.
  ///
  /// In en, this message translates to:
  /// **'Recent'**
  String get recentStatuses;

  /// No description provided for @savedStatuses.
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get savedStatuses;

  /// No description provided for @statusSavedMessage.
  ///
  /// In en, this message translates to:
  /// **'Status saved'**
  String get statusSavedMessage;

  /// No description provided for @noSavedStatusesMessage.
  ///
  /// In en, this message translates to:
  /// **'No saved statuses'**
  String get noSavedStatusesMessage;

  /// No description provided for @noWhatsappFoundMessage.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp isn\'t installed on this phone'**
  String get noWhatsappFoundMessage;

  /// No description provided for @appLanguageLabel.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get appLanguageLabel;

  /// No description provided for @saveButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get saveButtonLabel;

  /// No description provided for @shareButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get shareButtonLabel;

  /// No description provided for @okButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get okButtonLabel;

  /// No description provided for @cancelButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelButtonLabel;

  /// No description provided for @closeButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get closeButtonLabel;

  /// No description provided for @howDoesItWorkTitle.
  ///
  /// In en, this message translates to:
  /// **'How does it work?'**
  String get howDoesItWorkTitle;

  /// No description provided for @howDoesItWorkDescription.
  ///
  /// In en, this message translates to:
  /// **'We are not affiliated or officially connected with WhatsApp Inc in any way. And, we do not have any access to your WhatsApp messages.\n\nThis application is intended to provide you with a more convenient way to explore, save and share the status images and videos cached in your device storage'**
  String get howDoesItWorkDescription;

  /// No description provided for @aboutButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutButtonLabel;

  /// No description provided for @appThemeModeLabel.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appThemeModeLabel;

  /// No description provided for @systemDefaultLabel.
  ///
  /// In en, this message translates to:
  /// **'System Default'**
  String get systemDefaultLabel;

  /// No description provided for @couldNotSaveYourLanguagePreference.
  ///
  /// In en, this message translates to:
  /// **'Could not save your language preference'**
  String get couldNotSaveYourLanguagePreference;

  /// No description provided for @couldNotSaveYourThemePreference.
  ///
  /// In en, this message translates to:
  /// **'Could not save your theme preference'**
  String get couldNotSaveYourThemePreference;

  /// No description provided for @giveStoragePermission.
  ///
  /// In en, this message translates to:
  /// **'Allow access'**
  String get giveStoragePermission;

  /// No description provided for @needToGiveStoragePermission.
  ///
  /// In en, this message translates to:
  /// **'To show WhatsApp statuses, Status Saver needs access to the status files already stored on this phone.'**
  String get needToGiveStoragePermission;

  /// No description provided for @couldNotOpenAppSettings.
  ///
  /// In en, this message translates to:
  /// **'Could not open app settings for storage permission.'**
  String get couldNotOpenAppSettings;

  /// No description provided for @allowStoragePermission.
  ///
  /// In en, this message translates to:
  /// **'Allow storage permission for Status Saver'**
  String get allowStoragePermission;

  /// No description provided for @openWhatsAppLabel.
  ///
  /// In en, this message translates to:
  /// **'Open WhatsApp'**
  String get openWhatsAppLabel;

  /// No description provided for @openW4BLabel.
  ///
  /// In en, this message translates to:
  /// **'Open WhatsApp Business'**
  String get openW4BLabel;

  /// No description provided for @doNotHaveSeenStatusesMessage.
  ///
  /// In en, this message translates to:
  /// **'You do not have seen any statuses yet, go and watch some statuses'**
  String get doNotHaveSeenStatusesMessage;

  /// No description provided for @systemThemeLabel.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get systemThemeLabel;

  /// No description provided for @lightThemeLabel.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get lightThemeLabel;

  /// No description provided for @darkThemeLabel.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get darkThemeLabel;

  /// No description provided for @exitButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Exit'**
  String get exitButtonLabel;

  /// No description provided for @exitWarningTitle.
  ///
  /// In en, this message translates to:
  /// **'Exit Status Saver'**
  String get exitWarningTitle;

  /// No description provided for @exitWarningMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to exit?'**
  String get exitWarningMessage;

  /// No description provided for @deleteButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get deleteButtonLabel;

  /// No description provided for @deleteStatusWarningTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete status?'**
  String get deleteStatusWarningTitle;

  /// No description provided for @deleteStatusWarningMessage.
  ///
  /// In en, this message translates to:
  /// **'This permanently removes the saved file from your phone.'**
  String get deleteStatusWarningMessage;

  /// No description provided for @deletedStatusMessage.
  ///
  /// In en, this message translates to:
  /// **'Status deleted'**
  String get deletedStatusMessage;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @filterAllLabel.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get filterAllLabel;

  /// No description provided for @filterPhotosLabel.
  ///
  /// In en, this message translates to:
  /// **'Photos'**
  String get filterPhotosLabel;

  /// No description provided for @filterVideosLabel.
  ///
  /// In en, this message translates to:
  /// **'Videos'**
  String get filterVideosLabel;

  /// No description provided for @permissionTitle.
  ///
  /// In en, this message translates to:
  /// **'See statuses on this phone'**
  String get permissionTitle;

  /// No description provided for @permissionPrivacyNote.
  ///
  /// In en, this message translates to:
  /// **'We never read your chats. Status Saver only looks at status photos and videos already cached on your device.'**
  String get permissionPrivacyNote;

  /// No description provided for @emptyRecentTitle.
  ///
  /// In en, this message translates to:
  /// **'No statuses yet'**
  String get emptyRecentTitle;

  /// No description provided for @emptyRecentMessage.
  ///
  /// In en, this message translates to:
  /// **'Watch a status in WhatsApp, then come back and pull to refresh.'**
  String get emptyRecentMessage;

  /// No description provided for @emptySavedTitle.
  ///
  /// In en, this message translates to:
  /// **'Nothing saved yet'**
  String get emptySavedTitle;

  /// No description provided for @emptySavedMessage.
  ///
  /// In en, this message translates to:
  /// **'Saved statuses will show up here. Tap download on any status to keep it.'**
  String get emptySavedMessage;

  /// No description provided for @emptyFilterPhotosMessage.
  ///
  /// In en, this message translates to:
  /// **'No photos in this list'**
  String get emptyFilterPhotosMessage;

  /// No description provided for @emptyFilterVideosMessage.
  ///
  /// In en, this message translates to:
  /// **'No videos in this list'**
  String get emptyFilterVideosMessage;

  /// No description provided for @errorTitle.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get errorTitle;

  /// No description provided for @errorMessage.
  ///
  /// In en, this message translates to:
  /// **'Please try again. If this keeps happening, restart the app.'**
  String get errorMessage;

  /// No description provided for @retryButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get retryButtonLabel;

  /// No description provided for @deleteFailedMessage.
  ///
  /// In en, this message translates to:
  /// **'Could not delete this status'**
  String get deleteFailedMessage;

  /// No description provided for @saveFailedMessage.
  ///
  /// In en, this message translates to:
  /// **'Could not save this status'**
  String get saveFailedMessage;

  /// No description provided for @quickSaveTooltip.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get quickSaveTooltip;

  /// No description provided for @shareSubject.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp Status'**
  String get shareSubject;

  /// No description provided for @whatsappMissingTitle.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp isn\'t installed'**
  String get whatsappMissingTitle;

  /// No description provided for @whatsappMissingMessage.
  ///
  /// In en, this message translates to:
  /// **'Install WhatsApp or WhatsApp Business to browse statuses from this device.'**
  String get whatsappMissingMessage;

  /// No description provided for @themeSectionLabel.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get themeSectionLabel;

  /// No description provided for @languageSectionLabel.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageSectionLabel;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'af',
        'ar',
        'az',
        'bn',
        'en',
        'es',
        'gu',
        'hi',
        'ja',
        'kn',
        'ko',
        'mr',
        'pa',
        'ta',
        'te',
        'ur'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'af':
      return AppLocalizationsAf();
    case 'ar':
      return AppLocalizationsAr();
    case 'az':
      return AppLocalizationsAz();
    case 'bn':
      return AppLocalizationsBn();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'gu':
      return AppLocalizationsGu();
    case 'hi':
      return AppLocalizationsHi();
    case 'ja':
      return AppLocalizationsJa();
    case 'kn':
      return AppLocalizationsKn();
    case 'ko':
      return AppLocalizationsKo();
    case 'mr':
      return AppLocalizationsMr();
    case 'pa':
      return AppLocalizationsPa();
    case 'ta':
      return AppLocalizationsTa();
    case 'te':
      return AppLocalizationsTe();
    case 'ur':
      return AppLocalizationsUr();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
