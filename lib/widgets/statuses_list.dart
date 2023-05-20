import 'package:status_saver/common.dart';
import 'package:status_saver/constants.dart';
import 'package:status_saver/models/tab_type.dart';
import 'package:status_saver/provider/statuses_provider.dart';
import 'package:status_saver/screens/no_recent_statuses_found_screen.dart';
import 'package:status_saver/screens/not_found_screen.dart';
import 'package:status_saver/widgets/image_tile.dart';
import 'package:status_saver/widgets/video_tile.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StatusesList extends StatelessWidget {
  final TabType tabType;
  final StatusesProvider statusesProvider;
  const StatusesList({
    super.key,
    required this.tabType,
    required this.statusesProvider,
  });

  @override
  Widget build(BuildContext context) {

    List<String>? statuses = statusesProvider.statuses;

    if(statuses != null && statuses.isNotEmpty) {
      return StaggeredGridView.countBuilder(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
        itemCount: statuses.length,
        itemBuilder: (context, index) {
          final String statusPath  = statuses[index];
          if(statusPath.endsWith(jpg)) {
            return ImageTile(imagePath: statusPath);
          } else {
            return VideoTile(videoPath: statusPath);
          }
        }
      );
    }
    if(tabType == TabType.recent) {
      return const NoRecentStatusesFoundScreen();
    } else {
      return NotFoundScreen(message: AppLocalizations.of(context)?.noSavedStatusesMessage ?? "No Saved Statuses Found");
    }
  }
}