// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get helloWorld => '안녕, 세상아!';

  @override
  String get appTitle => '상태 저장기';

  @override
  String get recentStatuses => '최근';

  @override
  String get savedStatuses => '저장됨';

  @override
  String get statusSavedMessage => '상태 저장됨';

  @override
  String get noSavedStatusesMessage => '저장된 상태가 없습니다';

  @override
  String get noWhatsappFoundMessage => '당신의 모바일에 WhatsApp이 존재하지 않습니다';

  @override
  String get appLanguageLabel => '앱 언어';

  @override
  String get saveButtonLabel => '저장';

  @override
  String get shareButtonLabel => '공유';

  @override
  String get okButtonLabel => '확인';

  @override
  String get cancelButtonLabel => '취소';

  @override
  String get closeButtonLabel => '닫기';

  @override
  String get howDoesItWorkTitle => '어떻게 작동하나요?';

  @override
  String get howDoesItWorkDescription =>
      '저희는 WhatsApp Inc와 어떠한 제휴 관계도 없으며 공식적으로 연결되어 있지 않습니다. 또한, WhatsApp 메시지에 대한 접근 권한이 없습니다.\n\n이 애플리케이션은 당신의 기기 저장 공간에 캐시된 상태 이미지와 동영상을 더 편리하게 찾아보고 저장하고 공유할 수 있는 방법을 제공하기 위해 만들어졌습니다.';

  @override
  String get aboutButtonLabel => '앱 정보';

  @override
  String get appThemeModeLabel => '앱 테마 모드';

  @override
  String get systemDefaultLabel => '시스템 기본값';

  @override
  String get couldNotSaveYourLanguagePreference => '언어 설정을 저장할 수 없습니다';

  @override
  String get couldNotSaveYourThemePreference => '테마 설정을 저장할 수 없습니다';

  @override
  String get giveStoragePermission => '저장소 권한 부여';

  @override
  String get needToGiveStoragePermission => '이 애플리케이션에 대한 저장소 권한을 부여해야 합니다';

  @override
  String get couldNotOpenAppSettings => '저장소 권한을 위한 앱 설정을 열 수 없습니다';

  @override
  String get allowStoragePermission => '상태 저장기를 위해 저장소 권한 허용';

  @override
  String get openWhatsAppLabel => 'WhatsApp 열기';

  @override
  String get openW4BLabel => 'WhatsApp Business 열기';

  @override
  String get doNotHaveSeenStatusesMessage => '아직 상태를 보지 않았습니다. 상태를 확인해보세요';

  @override
  String get systemThemeLabel => '시스템 테마';

  @override
  String get lightThemeLabel => '라이트 테마';

  @override
  String get darkThemeLabel => '다크 테마';

  @override
  String get exitButtonLabel => '종료';

  @override
  String get exitWarningTitle => 'StatusSaver 종료';

  @override
  String get exitWarningMessage => '정말로 종료하시겠습니까?';

  @override
  String get deleteButtonLabel => '삭제';

  @override
  String get deleteStatusWarningTitle => '상태 삭제';

  @override
  String get deleteStatusWarningMessage => '이 상태를 영구적으로 삭제하시겠습니까?';

  @override
  String get deletedStatusMessage => '상태가 삭제되었습니다';

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
