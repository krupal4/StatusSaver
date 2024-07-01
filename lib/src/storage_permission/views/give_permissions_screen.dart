import 'package:flutter/material.dart';
import 'package:status_saver/src/localization/extensions/on_build_context.dart';

class GivePermissionsScreen extends StatelessWidget {
  const GivePermissionsScreen({
    super.key,
    required this.onRequestPermission,
  });
  final void Function() onRequestPermission;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            context.l10n
                .needToGiveStoragePermission, // FIXME: give better message using GPT
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: onRequestPermission,
          child: Text(context.l10n.giveStoragePermission),
        ),
      ],
    );
  }
}
