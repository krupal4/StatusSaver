import 'package:appcheck/appcheck.dart';
import 'package:status_saver/src/home/models/whatsapp_type_enum.dart';

Future<void> launchWhatsApp(WhatsAppType type) {
  final String package = type == WhatsAppType.whatsApp
      ? 'com.whatsapp'
      : 'com.whatsapp.w4b';
  return AppCheck.launchApp(package);
}
