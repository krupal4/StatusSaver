import 'package:status_saver/common.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchWhatsapp() async {
  final Uri url = Uri.parse("https://wa.me/send/");

  if(await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    // TODO give meaningful warning pop up  use through
    log('Could not launch Whatsapp');
  }
}