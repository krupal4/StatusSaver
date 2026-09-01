import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> appScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

void showAppSnackBarMessage(String message) {
  final ScaffoldMessengerState? messenger =
      appScaffoldMessengerKey.currentState;
  if (messenger == null) {
    return;
  }
  messenger
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(content: Text(message)),
    );
}

void showAppSnackBar(BuildContext context, String message) {
  if (context.mounted) {
    final ScaffoldMessengerState? local = ScaffoldMessenger.maybeOf(context);
    if (local != null) {
      local
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text(message)),
        );
      return;
    }
  }
  showAppSnackBarMessage(message);
}
