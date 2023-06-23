import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:status_saver/common.dart';
import 'package:status_saver/constants.dart';
import 'package:status_saver/models/tab_type.dart';
import 'package:status_saver/screens/home_screen.dart';
import 'package:status_saver/screens/no_recent_statuses_found_screen.dart';
import 'package:status_saver/screens/not_found_screen.dart';
import 'package:status_saver/widgets/image_tile.dart';
import 'package:status_saver/widgets/video_tile.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StatusesList extends StatefulWidget {
  final TabType tabType;
  const StatusesList({
    super.key,
    required this.tabType,
  });

  @override
  State<StatusesList> createState() => _StatusesListState();
}

class _StatusesListState extends State<StatusesList>
    with AutomaticKeepAliveClientMixin {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer(builder: (context, ref, _) {
      List<String>? statuses = ref.watch(
          widget.tabType == TabType.recent
              ? recentStatusesProvider
              : savedStatusesProvider);

      if (statuses == null) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (statuses.isNotEmpty) {

        return Scrollbar(
          controller: scrollController,
          interactive: true,
          child: StaggeredGridView.countBuilder(   
              controller: scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
              itemCount: statuses.length,
              itemBuilder: (context, index) {
                final String statusPath = statuses[index];
                if (statusPath.endsWith(jpg)) {
                  return ImageTile(imagePath: statusPath);
                } else {
                  return VideoTile(videoPath: statusPath);
                }
              })
        );
      }
      if (widget.tabType == TabType.recent) {
        return const NoRecentStatusesFoundScreen();
      } else {
        return NotFoundScreen(
            message: AppLocalizations.of(context)?.noSavedStatusesMessage ??
                "No Saved Statuses Found");
      }
    });
  }
  
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
