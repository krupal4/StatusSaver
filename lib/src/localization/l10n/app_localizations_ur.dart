// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get helloWorld => 'ہیلو ورلڈ!';

  @override
  String get appTitle => 'سٹیٹس سیو کرنے والا';

  @override
  String get recentStatuses => 'حالیہ';

  @override
  String get savedStatuses => 'محفوظ شدہ';

  @override
  String get statusSavedMessage => 'حالت محفوظ کر دی گئی';

  @override
  String get noSavedStatusesMessage => 'کوئی محفوظ شدہ حالتیں نہیں';

  @override
  String get noWhatsappFoundMessage => 'آپ کے موبائل پر واٹس ایپ موجود نہیں ہے';

  @override
  String get appLanguageLabel => 'اپلیکیشن کی زبان';

  @override
  String get saveButtonLabel => 'محفوظ کریں';

  @override
  String get shareButtonLabel => 'شئیر کریں';

  @override
  String get okButtonLabel => 'ٹھیک ہے';

  @override
  String get cancelButtonLabel => 'منسوخ کریں';

  @override
  String get closeButtonLabel => 'بند کریں';

  @override
  String get howDoesItWorkTitle => 'یہ کام کیسے کرتا ہے؟';

  @override
  String get howDoesItWorkDescription =>
      'ہم WhatsApp انک سے کسی بھی طرح تعلق نہیں رکھتے ہیں۔ اور ہمیں آپ کے واٹس ایپ پیغاموں تک رسائی کا کوئی راستہ نہیں ہے۔\n\nیہ ایپلیکیشن آپ کو آپ کی ڈیوائس میں ذخیرہ ہونے والی حالتوں کی تصاویر اور ویڈیوز کو کھولنے، محفوظ کرنے اور شئیر کرنے کا آسان ترین طریقہ فراہم کرنے کے لئے تشکیل دی گئی ہے';

  @override
  String get aboutButtonLabel => 'اے پی پر معلومات';

  @override
  String get appThemeModeLabel => 'اے پی کا تھیم موڈ';

  @override
  String get systemDefaultLabel => 'سسٹم ڈیفالٹ';

  @override
  String get couldNotSaveYourLanguagePreference =>
      'آپ کی زبان کی ترجیح محفوظ نہیں کی جا سکی';

  @override
  String get couldNotSaveYourThemePreference =>
      'آپ کی تھیم کی ترجیح محفوظ نہیں کی جا سکی';

  @override
  String get giveStoragePermission => 'ذخیرہ کی اجازت دیں';

  @override
  String get needToGiveStoragePermission =>
      'اس ایپلیکیشن کے لئے آپ کو ذخیرہ کی اجازت دینے کی ضرورت ہے۔';

  @override
  String get couldNotOpenAppSettings =>
      'ذخیرہ کی اجازت کے لئے ایپ کی ترتیبات کھولنے میں ناکامی';

  @override
  String get allowStoragePermission =>
      'سٹیٹس سیو کرنے والے کو ذخیرہ کی اجازت دیں';

  @override
  String get openWhatsAppLabel => 'واٹس ایپ کھولیں';

  @override
  String get openW4BLabel => 'واٹس ایپ بزنس کھولیں';

  @override
  String get doNotHaveSeenStatusesMessage =>
      'آپ نے ابھی تک کوئی حالت دیکھی نہیں ہے، جائیں اور کچھ حالتوں کو دیکھیں';

  @override
  String get systemThemeLabel => 'سسٹم تھیم';

  @override
  String get lightThemeLabel => 'روشنی کا تھیم';

  @override
  String get darkThemeLabel => 'تاریک تھیم';

  @override
  String get exitButtonLabel => 'بند کریں';

  @override
  String get exitWarningTitle => 'اسٹیٹس سیو کرنے والے سے باہر نکلیں';

  @override
  String get exitWarningMessage => 'کیا آپ واقعی بند کرنا چاہتے ہیں؟';

  @override
  String get deleteButtonLabel => 'حذف کریں';

  @override
  String get deleteStatusWarningTitle => 'حالت کو حذف کریں';

  @override
  String get deleteStatusWarningMessage =>
      'کیا آپ اس حالت کو مستقل طور پر حذف کرنا چاہتے ہیں؟';

  @override
  String get deletedStatusMessage => 'حالت حذف کردی گئی ہے';

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
