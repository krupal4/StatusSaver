import 'package:flutter/material.dart';
import 'package:status_saver/src/common/helpers/whatsapp_launcher.dart';
import 'package:status_saver/src/home/models/whatsapp_type_enum.dart';
import 'package:status_saver/src/localization/extensions/on_build_context.dart';

class OpenWhatsAppButton extends StatelessWidget {
  const OpenWhatsAppButton({super.key, required this.type});

  final WhatsAppType type;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: () => launchWhatsApp(type),
      icon: const Icon(Icons.open_in_new_rounded),
      label: Text(
        type == WhatsAppType.whatsApp
            ? context.l10n.openWhatsAppLabel
            : context.l10n.openW4BLabel,
      ),
    );
  }
}
