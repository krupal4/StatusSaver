import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:status_saver/src/common/helpers/app_haptics.dart';
import 'package:status_saver/src/home/models/media_filter.dart';
import 'package:status_saver/src/home/notifiers/media_filter_notifier.dart';
import 'package:status_saver/src/localization/extensions/on_build_context.dart';
import 'package:status_saver/src/theme/tokens.dart';

class MediaFilterBar extends ConsumerWidget implements PreferredSizeWidget {
  const MediaFilterBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(52);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MediaFilter selected = ref.watch(mediaFilterProvider);
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md,
        0,
        AppSpacing.md,
        AppSpacing.xs,
      ),
      child: Row(
        children: [
          _FilterChip(
            label: l10n.filterAllLabel,
            selected: selected == MediaFilter.all,
            onSelected: () => _select(ref, MediaFilter.all),
          ),
          const SizedBox(width: AppSpacing.xs),
          _FilterChip(
            label: l10n.filterPhotosLabel,
            selected: selected == MediaFilter.photos,
            onSelected: () => _select(ref, MediaFilter.photos),
          ),
          const SizedBox(width: AppSpacing.xs),
          _FilterChip(
            label: l10n.filterVideosLabel,
            selected: selected == MediaFilter.videos,
            onSelected: () => _select(ref, MediaFilter.videos),
          ),
        ],
      ),
    );
  }

  void _select(WidgetRef ref, MediaFilter filter) {
    AppHaptics.selection();
    ref.read(mediaFilterProvider.notifier).set(filter);
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  final String label;
  final bool selected;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      showCheckmark: false,
      onSelected: (_) => onSelected(),
    );
  }
}
