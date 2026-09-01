// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World!';

  @override
  String get appTitle => 'Status Saver';

  @override
  String get recentStatuses => 'Recent';

  @override
  String get savedStatuses => 'Saved';

  @override
  String get statusSavedMessage => 'Status saved';

  @override
  String get noSavedStatusesMessage => 'No saved statuses';

  @override
  String get noWhatsappFoundMessage =>
      'WhatsApp isn\'t installed on this phone';

  @override
  String get appLanguageLabel => 'Language';

  @override
  String get saveButtonLabel => 'Save';

  @override
  String get shareButtonLabel => 'Share';

  @override
  String get okButtonLabel => 'OK';

  @override
  String get cancelButtonLabel => 'Cancel';

  @override
  String get closeButtonLabel => 'Close';

  @override
  String get howDoesItWorkTitle => 'How does it work?';

  @override
  String get howDoesItWorkDescription =>
      'We are not affiliated or officially connected with WhatsApp Inc in any way. And, we do not have any access to your WhatsApp messages.\n\nThis application is intended to provide you with a more convenient way to explore, save and share the status images and videos cached in your device storage';

  @override
  String get aboutButtonLabel => 'About';

  @override
  String get appThemeModeLabel => 'Appearance';

  @override
  String get systemDefaultLabel => 'System Default';

  @override
  String get couldNotSaveYourLanguagePreference =>
      'Could not save your language preference';

  @override
  String get couldNotSaveYourThemePreference =>
      'Could not save your theme preference';

  @override
  String get giveStoragePermission => 'Allow access';

  @override
  String get needToGiveStoragePermission =>
      'To show WhatsApp statuses, Status Saver needs access to the status files already stored on this phone.';

  @override
  String get couldNotOpenAppSettings =>
      'Could not open app settings for storage permission.';

  @override
  String get allowStoragePermission =>
      'Allow storage permission for Status Saver';

  @override
  String get openWhatsAppLabel => 'Open WhatsApp';

  @override
  String get openW4BLabel => 'Open WhatsApp Business';

  @override
  String get doNotHaveSeenStatusesMessage =>
      'You do not have seen any statuses yet, go and watch some statuses';

  @override
  String get systemThemeLabel => 'System';

  @override
  String get lightThemeLabel => 'Light';

  @override
  String get darkThemeLabel => 'Dark';

  @override
  String get exitButtonLabel => 'Exit';

  @override
  String get exitWarningTitle => 'Exit Status Saver';

  @override
  String get exitWarningMessage => 'Are you sure you want to exit?';

  @override
  String get deleteButtonLabel => 'Delete';

  @override
  String get deleteStatusWarningTitle => 'Delete status?';

  @override
  String get deleteStatusWarningMessage =>
      'This permanently removes the saved file from your phone.';

  @override
  String get deletedStatusMessage => 'Status deleted';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get filterAllLabel => 'All';

  @override
  String get filterPhotosLabel => 'Photos';

  @override
  String get filterVideosLabel => 'Videos';

  @override
  String get permissionTitle => 'See statuses on this phone';

  @override
  String get permissionPrivacyNote =>
      'We never read your chats. Status Saver only looks at status photos and videos already cached on your device.';

  @override
  String get emptyRecentTitle => 'No statuses yet';

  @override
  String get emptyRecentMessage =>
      'Watch a status in WhatsApp, then come back and pull to refresh.';

  @override
  String get emptySavedTitle => 'Nothing saved yet';

  @override
  String get emptySavedMessage =>
      'Saved statuses will show up here. Tap download on any status to keep it.';

  @override
  String get emptyFilterPhotosMessage => 'No photos in this list';

  @override
  String get emptyFilterVideosMessage => 'No videos in this list';

  @override
  String get errorTitle => 'Something went wrong';

  @override
  String get errorMessage =>
      'Please try again. If this keeps happening, restart the app.';

  @override
  String get retryButtonLabel => 'Try again';

  @override
  String get deleteFailedMessage => 'Could not delete this status';

  @override
  String get saveFailedMessage => 'Could not save this status';

  @override
  String get quickSaveTooltip => 'Save';

  @override
  String get shareSubject => 'WhatsApp Status';

  @override
  String get whatsappMissingTitle => 'WhatsApp isn\'t installed';

  @override
  String get whatsappMissingMessage =>
      'Install WhatsApp or WhatsApp Business to browse statuses from this device.';

  @override
  String get themeSectionLabel => 'Appearance';

  @override
  String get languageSectionLabel => 'Language';
}
