import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:status_saver/src/common/helpers/app_haptics.dart';
import 'package:status_saver/src/common/helpers/app_snackbar.dart';
import 'package:status_saver/src/common/helpers/statuses_helper.dart';
import 'package:status_saver/src/common/views/glass.dart';
import 'package:status_saver/src/localization/extensions/on_build_context.dart';
import 'package:status_saver/src/statuses/notifiers/statuses_notifier.dart';
import 'package:status_saver/src/theme/motion.dart';
import 'package:status_saver/src/theme/tokens.dart';

class CinemaTopBar extends StatelessWidget {
  const CinemaTopBar({
    super.key,
    required this.visible,
    required this.statusPath,
    this.onDeletePressed,
  });

  final bool visible;
  final String statusPath;
  final Future<void> Function(Future<bool?> Function() deleteStatus)?
      onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: visible ? 1 : 0,
      duration: AppMotion.micro,
      curve: AppMotion.emphasized,
      child: IgnorePointer(
        ignoring: !visible,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).maybePop(),
                  icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
                ),
                const Spacer(),
                if (isItSavedStatus(statusPath))
                  DeleteSavedStatusAction(
                    statusPath: statusPath,
                    onPressed: onDeletePressed,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CinemaActionBar extends ConsumerWidget {
  const CinemaActionBar({
    super.key,
    required this.statusPath,
    required this.visible,
    this.pauseVideoStatus,
    this.extraBottom = 0,
  });

  final String statusPath;
  final bool visible;
  final Future<void> Function()? pauseVideoStatus;
  final double extraBottom;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isSaved = isItSavedStatus(statusPath);
    final l10n = context.l10n;
    final double bottomInset = MediaQuery.paddingOf(context).bottom;

    return AnimatedOpacity(
      opacity: visible ? 1 : 0,
      duration: AppMotion.micro,
      curve: AppMotion.emphasized,
      child: IgnorePointer(
        ignoring: !visible,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              AppSpacing.md,
              0,
              AppSpacing.md,
              bottomInset + AppSpacing.md + extraBottom,
            ),
            child: Glass(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.xs,
                vertical: AppSpacing.xs,
              ),
              child: Row(
                children: [
                  if (!isSaved)
                    _ActionButton(
                      icon: Icons.download_rounded,
                      label: l10n.saveButtonLabel,
                      onTap: () async {
                        AppHaptics.light();
                        final bool saved = await ref
                            .read(savedStatusesProvider.notifier)
                            .saveStatus(statusPath);
                        if (!context.mounted) {
                          return;
                        }
                        showAppSnackBar(
                          context,
                          saved
                              ? l10n.statusSavedMessage
                              : l10n.saveFailedMessage,
                        );
                      },
                    ),
                  if (!isSaved) const SizedBox(width: AppSpacing.xs),
                  _ActionButton(
                    icon: Icons.ios_share_rounded,
                    label: l10n.shareButtonLabel,
                    onTap: () async {
                      if (statusPath.endsWith('.mp4') &&
                          pauseVideoStatus != null) {
                        await pauseVideoStatus!();
                      }
                      await Share.shareXFiles(
                        [XFile(statusPath)],
                        subject: l10n.shareSubject,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton.icon(
        onPressed: onTap,
        icon: Icon(icon, color: Colors.white),
        label: Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}

class DeleteSavedStatusAction extends ConsumerWidget {
  const DeleteSavedStatusAction({
    super.key,
    required this.statusPath,
    this.onPressed,
  });
  final String statusPath;
  final Future<void> Function(Future<bool?> Function() deleteStatus)? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      tooltip: context.l10n.deleteButtonLabel,
      onPressed: onPressed != null
          ? () => onPressed!(() => deleteStatus(context, ref))
          : () => deleteStatus(context, ref),
      icon: const Icon(
        Icons.delete_outline_rounded,
        color: Colors.white,
      ),
    );
  }

  Future<bool?> deleteStatus(BuildContext context, WidgetRef ref) =>
      showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: Text(context.l10n.deleteStatusWarningTitle),
          content: Text(context.l10n.deleteStatusWarningMessage),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(context.l10n.cancelButtonLabel),
            ),
            TextButton(
              onPressed: () async {
                AppHaptics.medium();
                final String deletedMessage = context.l10n.deletedStatusMessage;
                final String failedMessage = context.l10n.deleteFailedMessage;
                final NavigatorState navigator = Navigator.of(context);
                final bool isDeleted = await ref
                    .read(savedStatusesProvider.notifier)
                    .deleteStatus(statusPath);
                navigator.pop();
                if (isDeleted) {
                  navigator.pop();
                }
                showAppSnackBarMessage(
                  isDeleted ? deletedMessage : failedMessage,
                );
              },
              child: Text(context.l10n.deleteButtonLabel),
            ),
          ],
        ),
      );
}
