// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Azerbaijani (`az`).
class AppLocalizationsAz extends AppLocalizations {
  AppLocalizationsAz([String locale = 'az']) : super(locale);

  @override
  String get helloWorld => 'Salam Dünya!';

  @override
  String get appTitle => 'Status Saxlayıcı';

  @override
  String get recentStatuses => 'Sonuncular';

  @override
  String get savedStatuses => 'Saxlanılanlar';

  @override
  String get statusSavedMessage => 'Status saxlanıldı';

  @override
  String get noSavedStatusesMessage => 'Saxlanılan status yoxdur';

  @override
  String get noWhatsappFoundMessage => 'Mobilinizdə WhatsApp yoxdur';

  @override
  String get appLanguageLabel => 'Proqram Dil';

  @override
  String get saveButtonLabel => 'Saxla';

  @override
  String get shareButtonLabel => 'Paylaş';

  @override
  String get okButtonLabel => 'OK';

  @override
  String get cancelButtonLabel => 'İmtina et';

  @override
  String get closeButtonLabel => 'Bağla';

  @override
  String get howDoesItWorkTitle => 'Bu necə işləyir?';

  @override
  String get howDoesItWorkDescription =>
      'Biz WhatsApp Inc. ilə heç bir əlaqəsi olmayan və rəsmi şəkildə əlaqələndirilməmişik. Həmçinin, WhatsApp mesajlarınıza heç bir girişimiz yoxdur.\n\nBu tətbiq, cihazınızın saxlamağa qənaətli bir yolu təmin etmək, saxlanılan status şəkillərini və videolarını kəşf etmək və paylaşmaq üçün nəzərdə tutulmuşdur.';

  @override
  String get aboutButtonLabel => 'Proqram haqqında';

  @override
  String get appThemeModeLabel => 'Proqram Masa Üstü Üzərindəki Modu';

  @override
  String get systemDefaultLabel => 'Sistem Standartı';

  @override
  String get couldNotSaveYourLanguagePreference =>
      'Dil tercihinizi saxlaya bilmədik';

  @override
  String get couldNotSaveYourThemePreference =>
      'Tema tercihinizi saxlaya bilmədik';

  @override
  String get giveStoragePermission => 'Yaddaş icazəsi verin';

  @override
  String get needToGiveStoragePermission =>
      'Bu tətbiq üçün yaddaş icazəsinə ehtiyacınız var.';

  @override
  String get couldNotOpenAppSettings =>
      'Yaddaş icazəsi üçün tətbiq ayarlarını açmaq mümkün olmadı.';

  @override
  String get allowStoragePermission =>
      'Status Saxlayıcıya yaddaş icazəsi verin';

  @override
  String get openWhatsAppLabel => 'WhatsApp\'ı aç';

  @override
  String get openW4BLabel => 'WhatsApp Business\'ı aç';

  @override
  String get doNotHaveSeenStatusesMessage =>
      'Hələ heç bir status görməmisiniz, get və bir neçə status izləyin';

  @override
  String get systemThemeLabel => 'Sistem Teması';

  @override
  String get lightThemeLabel => 'Açıq Tema';

  @override
  String get darkThemeLabel => 'Tünd Tema';

  @override
  String get exitButtonLabel => 'ÇIXIŞ';

  @override
  String get exitWarningTitle => 'StatusSaver\'dan Çıxmaq';

  @override
  String get exitWarningMessage => 'Çıxmağa əminsinizmi?';

  @override
  String get deleteButtonLabel => 'SİL';

  @override
  String get deleteStatusWarningTitle => 'Statusu Sil';

  @override
  String get deleteStatusWarningMessage =>
      'Bu statusu daimi olaraq silmək istəyirsiniz?';

  @override
  String get deletedStatusMessage => 'Status Silindi';

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
