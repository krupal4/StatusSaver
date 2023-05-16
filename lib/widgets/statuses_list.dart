// ignore_for_file: must_be_immutable

import 'package:status_saver/common.dart';
import 'package:status_saver/constants.dart';
import 'package:status_saver/models/tab_type.dart';
import 'package:status_saver/screens/no_recent_statuses_found_screen.dart';
import 'package:status_saver/screens/not_found_screen.dart';
import 'package:status_saver/services/get_statuses.dart';
import 'package:status_saver/widgets/image_tile.dart';
import 'package:status_saver/widgets/video_tile.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StatusesList extends StatefulWidget {
  List<String>? statuses;
  final TabType tabType;
  StatusesList({
    super.key,
    this.statuses,
    required this.tabType
  });

  @override
  State<StatusesList> createState() => _StatusesListState();
}

class _StatusesListState extends State<StatusesList> {

  @override
  void initState() {
    super.initState();
    widget.statuses ??= getStatuses(tabType: widget.tabType);
  }

  @override
  Widget build(BuildContext context) {
    if(widget.statuses != null && widget.statuses!.isNotEmpty) {
      return StaggeredGridView.countBuilder(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
        itemCount: widget.statuses!.length,
        itemBuilder: (context, index) {
          final String statusPath  = widget.statuses![index];
          if(statusPath.endsWith(jpg)) {
            return ImageTile(imagePath: statusPath);
          } else {
            return VideoTile(videoPath: statusPath);
          }
        }
      );
    }
    if(widget.tabType == TabType.recent) {
      return const NoRecentStatusesFoundScreen();
    } else {
      return NotFoundScreen(message: AppLocalizations.of(context)?.noSavedStatusesMessage ?? "No Saved Statuses Found");
    }
  }
}