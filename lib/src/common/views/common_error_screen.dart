import 'package:flutter/material.dart';
import 'package:status_saver/src/common/views/empty_state.dart';
import 'package:status_saver/src/localization/extensions/on_build_context.dart';

class AppErrorScreen extends StatelessWidget {
  const AppErrorScreen({super.key, this.onRetry});

  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return AppEmptyState(
      icon: Icons.error_outline_rounded,
      title: context.l10n.errorTitle,
      message: context.l10n.errorMessage,
      action: onRetry == null
          ? null
          : FilledButton(
              onPressed: onRetry,
              child: Text(context.l10n.retryButtonLabel),
            ),
    );
  }
}
