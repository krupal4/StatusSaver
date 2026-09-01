// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get helloWorld => 'こんにちは、世界！';

  @override
  String get appTitle => 'ステータスセーバー';

  @override
  String get recentStatuses => '最近のステータス';

  @override
  String get savedStatuses => '保存されたステータス';

  @override
  String get statusSavedMessage => 'ステータスが保存されました';

  @override
  String get noSavedStatusesMessage => '保存されたステータスはありません';

  @override
  String get noWhatsappFoundMessage => 'お使いのモバイルにWhatsAppが存在しません';

  @override
  String get appLanguageLabel => 'アプリの言語';

  @override
  String get saveButtonLabel => '保存';

  @override
  String get shareButtonLabel => '共有';

  @override
  String get okButtonLabel => 'OK';

  @override
  String get cancelButtonLabel => 'キャンセル';

  @override
  String get closeButtonLabel => '閉じる';

  @override
  String get howDoesItWorkTitle => 'どのように機能しますか？';

  @override
  String get howDoesItWorkDescription =>
      '当アプリはWhatsApp Incとは関連付けられておらず、公式に接続されていません。また、WhatsAppのメッセージにアクセスする権限もありません。\n\nこのアプリは、デバイスストレージにキャッシュされたステータスの画像や動画を簡単に探索、保存、共有するための便利な方法を提供することを目的としています。';

  @override
  String get aboutButtonLabel => 'アプリについて';

  @override
  String get appThemeModeLabel => 'アプリのテーマモード';

  @override
  String get systemDefaultLabel => 'システムデフォルト';

  @override
  String get couldNotSaveYourLanguagePreference => '言語設定を保存できませんでした';

  @override
  String get couldNotSaveYourThemePreference => 'テーマ設定を保存できませんでした';

  @override
  String get giveStoragePermission => 'ストレージの許可を与える';

  @override
  String get needToGiveStoragePermission => 'このアプリケーションにはストレージの許可が必要です。';

  @override
  String get couldNotOpenAppSettings => 'ストレージの許可のためのアプリの設定を開くことができませんでした。';

  @override
  String get allowStoragePermission => 'ステータスセーバーにストレージの許可を与える';

  @override
  String get openWhatsAppLabel => 'WhatsAppを開く';

  @override
  String get openW4BLabel => 'WhatsApp Businessを開く';

  @override
  String get doNotHaveSeenStatusesMessage =>
      'まだステータスを閲覧していません。いくつかのステータスを見てください';

  @override
  String get systemThemeLabel => 'システムテーマ';

  @override
  String get lightThemeLabel => 'ライトテーマ';

  @override
  String get darkThemeLabel => 'ダークテーマ';

  @override
  String get exitButtonLabel => '終了';

  @override
  String get exitWarningTitle => 'StatusSaverを終了する';

  @override
  String get exitWarningMessage => '本当に終了しますか？';

  @override
  String get deleteButtonLabel => '削除';

  @override
  String get deleteStatusWarningTitle => 'ステータスの削除';

  @override
  String get deleteStatusWarningMessage => 'このステータスを永久に削除しますか？';

  @override
  String get deletedStatusMessage => 'ステータスが削除されました';

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
