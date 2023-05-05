import 'package:status_saver/common.dart';
import 'package:status_saver/constants.dart';
import 'package:status_saver/screens/not_found_screen.dart';
import 'package:status_saver/screens/no_statuses_found_screen.dart';
import 'package:status_saver/widgets/image_tile.dart';
import 'package:status_saver/widgets/video_tile.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StatusesList extends StatefulWidget {
  Future<List<String>>? statuses;
  final Future<List<String>> Function() getStatuses;
  String? tabName;
  StatusesList({
    super.key,
    this.statuses,
    required this.getStatuses,
    this.tabName
  });

  @override
  State<StatusesList> createState() => _StatusesListState();
}

class _StatusesListState extends State<StatusesList> {

  @override
  void initState() {
    super.initState();
    widget.statuses ??= widget.getStatuses();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: widget.statuses,
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done ) {
          if(widget.tabName != null && widget.tabName == "Recent" && snapshot.data!.isEmpty) {
            return const NoStatusesFoundScreen();
          }
            return StaggeredGridView.countBuilder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final String statusPath  = snapshot.data![index];
                if(statusPath.endsWith(jpg)) {
                  return ImageTile(imagePath: statusPath);
                } else {
                  return VideoTile(videoPath: statusPath);
                }
              }
            );
        } else if(snapshot.connectionState == ConnectionState.waiting) {
          // TODO: give meaning ful loader
          return const Center(child: CircularProgressIndicator(color: Colors.black,),);
        } else {
          log('Some thing went wrong Please restart app');
          return const NotFoundScreen(message: 'Something went wrong restart app');
        }
      }
    );
  }
}