// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get helloWorld => '¡Hola Mundo!';

  @override
  String get appTitle => 'Ahorrador de Estados';

  @override
  String get recentStatuses => 'Recientes';

  @override
  String get savedStatuses => 'Guardados';

  @override
  String get statusSavedMessage => 'Estado guardado';

  @override
  String get noSavedStatusesMessage => 'No hay estados guardados';

  @override
  String get noWhatsappFoundMessage => 'WhatsApp no existe en tu móvil';

  @override
  String get appLanguageLabel => 'Idioma de la aplicación';

  @override
  String get saveButtonLabel => 'Guardar';

  @override
  String get shareButtonLabel => 'Compartir';

  @override
  String get okButtonLabel => 'Aceptar';

  @override
  String get cancelButtonLabel => 'Cancelar';

  @override
  String get closeButtonLabel => 'Cerrar';

  @override
  String get howDoesItWorkTitle => '¿Cómo funciona?';

  @override
  String get howDoesItWorkDescription =>
      'No estamos afiliados ni conectados oficialmente de ninguna manera con WhatsApp Inc. Y no tenemos acceso a tus mensajes de WhatsApp.\n\nEsta aplicación está destinada a proporcionarte una forma más conveniente de explorar, guardar y compartir las imágenes y videos de estados almacenados en tu dispositivo.';

  @override
  String get aboutButtonLabel => 'Acerca de la aplicación';

  @override
  String get appThemeModeLabel => 'Modo de tema de la aplicación';

  @override
  String get systemDefaultLabel => 'Predeterminado del sistema';

  @override
  String get couldNotSaveYourLanguagePreference =>
      'No se pudo guardar tu preferencia de idioma';

  @override
  String get couldNotSaveYourThemePreference =>
      'No se pudo guardar tu preferencia de tema';

  @override
  String get giveStoragePermission => 'Dar permiso de almacenamiento';

  @override
  String get needToGiveStoragePermission =>
      'Necesitas otorgar permisos de almacenamiento para esta aplicación.';

  @override
  String get couldNotOpenAppSettings =>
      'No se pudo abrir la configuración de la aplicación para el permiso de almacenamiento.';

  @override
  String get allowStoragePermission =>
      'Permitir permiso de almacenamiento para Ahorrador de Estados';

  @override
  String get openWhatsAppLabel => 'Abrir WhatsApp';

  @override
  String get openW4BLabel => 'Abrir WhatsApp Business';

  @override
  String get doNotHaveSeenStatusesMessage =>
      'Aún no has visto ningún estado, ve y mira algunos estados';

  @override
  String get systemThemeLabel => 'Tema del sistema';

  @override
  String get lightThemeLabel => 'Tema claro';

  @override
  String get darkThemeLabel => 'Tema oscuro';

  @override
  String get exitButtonLabel => 'SALIR';

  @override
  String get exitWarningTitle => 'Salir de StatusSaver';

  @override
  String get exitWarningMessage => '¿Estás seguro de que quieres salir?';

  @override
  String get deleteButtonLabel => 'ELIMINAR';

  @override
  String get deleteStatusWarningTitle => 'Eliminar Estado';

  @override
  String get deleteStatusWarningMessage =>
      '¿Deseas eliminar permanentemente este estado?';

  @override
  String get deletedStatusMessage => 'Estado Eliminado';

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
