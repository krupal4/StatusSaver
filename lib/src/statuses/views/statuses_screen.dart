import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:status_saver/src/common/extensions/async_value.dart';
import 'package:status_saver/src/home/models/tab_type.dart';
import 'package:status_saver/src/localization/extensions/on_build_context.dart';
import 'package:status_saver/src/statuses/notifiers/statuses_notifier.dart';
import 'package:status_saver/src/statuses/views/statuses_grid_widget.dart';

class StatusesScreen extends ConsumerWidget {
  const StatusesScreen({super.key, required this.tabType});
  final StatusTabType tabType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statusesProvider = tabType == StatusTabType.recent
        ? recentStatusesProvider
        : savedStatusesProvider;

    final noStatusesFoundMessage = tabType == StatusTabType.recent
        ? context.l10n.doNotHaveSeenStatusesMessage
        : context.l10n.noSavedStatusesMessage;

    ScrollController scrollController = ScrollController();
    return ref.watch(statusesProvider).whenWidget(
      (statuses) {
        return Scrollbar(
          controller: scrollController,
          interactive: true,
          child: RefreshIndicator(
            onRefresh: () async => await ref.refresh(statusesProvider),
            child: StatusesGridWidget(
              scrollController: scrollController,
              statuses: statuses,
              noStatusesFoundMessage: noStatusesFoundMessage,
            ),
          ),
        );
      },
    );
  }
}
