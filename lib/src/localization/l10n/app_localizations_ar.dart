// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get helloWorld => 'مرحبًا بالعالم!';

  @override
  String get appTitle => 'حفّاظ الحالة';

  @override
  String get recentStatuses => 'الأحداث الأخيرة';

  @override
  String get savedStatuses => 'الحالات المحفوظة';

  @override
  String get statusSavedMessage => 'تم حفظ الحالة';

  @override
  String get noSavedStatusesMessage => 'لا توجد حالات محفوظة';

  @override
  String get noWhatsappFoundMessage => 'لا يوجد تطبيق واتساب على جوالك';

  @override
  String get appLanguageLabel => 'لغة التطبيق';

  @override
  String get saveButtonLabel => 'حفظ';

  @override
  String get shareButtonLabel => 'مشاركة';

  @override
  String get okButtonLabel => 'موافق';

  @override
  String get cancelButtonLabel => 'إلغاء';

  @override
  String get closeButtonLabel => 'إغلاق';

  @override
  String get howDoesItWorkTitle => 'كيف يعمل؟';

  @override
  String get howDoesItWorkDescription =>
      'نحن لسنا مرتبطين أو متصلين رسميًا بشركة واتساب بأي شكل من الأشكال. وليس لدينا أي وصول إلى رسائل واتساب الخاصة بك.\n\nتهدف هذه التطبيق لتوفير وسيلة أكثر ملاءمة لاستكشاف وحفظ ومشاركة الصور ومقاطع الفيديو للحالات المخزنة في ذاكرة جهازك.';

  @override
  String get aboutButtonLabel => 'حول التطبيق';

  @override
  String get appThemeModeLabel => 'وضعية تصميم التطبيق';

  @override
  String get systemDefaultLabel => 'الوضعية الافتراضية للنظام';

  @override
  String get couldNotSaveYourLanguagePreference =>
      'تعذر حفظ تفضيلات اللغة الخاصة بك';

  @override
  String get couldNotSaveYourThemePreference =>
      'تعذر حفظ تفضيلات التصميم الخاصة بك';

  @override
  String get giveStoragePermission => 'منح إذن التخزين';

  @override
  String get needToGiveStoragePermission =>
      'يجب عليك منح إذن التخزين لهذا التطبيق.';

  @override
  String get couldNotOpenAppSettings =>
      'تعذر فتح إعدادات التطبيق لإذن التخزين.';

  @override
  String get allowStoragePermission => 'السماح بإذن التخزين لحفّاظ الحالة';

  @override
  String get openWhatsAppLabel => 'فتح واتساب';

  @override
  String get openW4BLabel => 'فتح واتساب بزنس';

  @override
  String get doNotHaveSeenStatusesMessage =>
      'لم تشاهد أي حالات حتى الآن، اذهب وشاهد بعض الحالات';

  @override
  String get systemThemeLabel => 'وضعية التصميم النظام';

  @override
  String get lightThemeLabel => 'الوضع الفاتح';

  @override
  String get darkThemeLabel => 'الوضع الداكن';

  @override
  String get exitButtonLabel => 'خروج';

  @override
  String get exitWarningTitle => 'خروج من التطبيق';

  @override
  String get exitWarningMessage => 'هل أنت متأكد من أنك تريد الخروج؟';

  @override
  String get deleteButtonLabel => 'حذف';

  @override
  String get deleteStatusWarningTitle => 'حذف الحالة';

  @override
  String get deleteStatusWarningMessage => 'هل تريد حذف هذه الحالة نهائياً؟';

  @override
  String get deletedStatusMessage => 'تم حذف الحالة';

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
