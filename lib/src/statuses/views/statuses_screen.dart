import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:status_saver/src/common/extensions/async_value.dart';
import 'package:status_saver/src/common/views/empty_state.dart';
import 'package:status_saver/src/home/models/media_filter.dart';
import 'package:status_saver/src/home/models/tab_type.dart';
import 'package:status_saver/src/home/notifiers/media_filter_notifier.dart';
import 'package:status_saver/src/home/services/whatsapp_type_notifier.dart';
import 'package:status_saver/src/home/views/open_whatsapp_button.dart';
import 'package:status_saver/src/localization/extensions/on_build_context.dart';
import 'package:status_saver/src/statuses/notifiers/statuses_notifier.dart';
import 'package:status_saver/src/statuses/views/statuses_grid_widget.dart';

class StatusesScreen extends ConsumerStatefulWidget {
  const StatusesScreen({super.key, required this.tabType});
  final StatusTabType tabType;

  @override
  ConsumerState<StatusesScreen> createState() => _StatusesScreenState();
}

class _StatusesScreenState extends ConsumerState<StatusesScreen> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final statusesProvider = widget.tabType == StatusTabType.recent
        ? recentStatusesProvider
        : savedStatusesProvider;
    final MediaFilter filter = ref.watch(mediaFilterProvider);

    return ref.watch(statusesProvider).whenWidget(
      onRetry: () => ref.invalidate(statusesProvider),
      (statuses) {
        final List<String> filtered =
            statuses.where(filter.matches).toList(growable: false);

        if (filtered.isEmpty) {
          return RefreshIndicator(
            onRefresh: () async => ref.invalidate(statusesProvider),
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.55,
                  child: _EmptyStatuses(
                    tabType: widget.tabType,
                    filter: filter,
                    hasAnyStatuses: statuses.isNotEmpty,
                  ),
                ),
              ],
            ),
          );
        }

        return Scrollbar(
          controller: _scrollController,
          interactive: true,
          child: RefreshIndicator(
            onRefresh: () async => ref.invalidate(statusesProvider),
            child: StatusesGridWidget(
              scrollController: _scrollController,
              statuses: filtered,
              showQuickSave: widget.tabType == StatusTabType.recent,
            ),
          ),
        );
      },
    );
  }
}

class _EmptyStatuses extends ConsumerWidget {
  const _EmptyStatuses({
    required this.tabType,
    required this.filter,
    required this.hasAnyStatuses,
  });

  final StatusTabType tabType;
  final MediaFilter filter;
  final bool hasAnyStatuses;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    if (hasAnyStatuses) {
      return AppEmptyState(
        icon: filter == MediaFilter.videos
            ? Icons.videocam_off_outlined
            : Icons.photo_outlined,
        title: filter == MediaFilter.videos
            ? l10n.emptyFilterVideosMessage
            : l10n.emptyFilterPhotosMessage,
        message: tabType == StatusTabType.saved
            ? l10n.emptySavedMessage
            : l10n.emptyRecentMessage,
      );
    }

    if (tabType == StatusTabType.saved) {
      return AppEmptyState(
        icon: Icons.bookmark_border_rounded,
        title: l10n.emptySavedTitle,
        message: l10n.emptySavedMessage,
      );
    }

    final whatsAppType = ref.watch(whatsAppTypeProvider).valueOrNull;
    return AppEmptyState(
      icon: Icons.auto_stories_outlined,
      title: l10n.emptyRecentTitle,
      message: l10n.emptyRecentMessage,
      action: whatsAppType == null
          ? null
          : OpenWhatsAppButton(type: whatsAppType),
    );
  }
}
