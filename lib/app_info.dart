import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:status_saver/common.dart';

const String applicationVersion = "1.0.0";
String applicationName(BuildContext context) => AppLocalizations.of(context)?.appTitle ?? "WhatsApp Status Saver";

Icon applicationIcon = const Icon(FontAwesomeIcons.squareVirus); // TODO: provide application icon