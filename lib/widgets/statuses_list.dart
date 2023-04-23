import 'package:status_saver/common.dart';
import 'package:status_saver/constants.dart';
import 'package:status_saver/screens/not_found_screen.dart';
import 'package:status_saver/widgets/image_tile.dart';
import 'package:status_saver/widgets/video_tile.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StatusesList extends StatelessWidget {
  const StatusesList({
    super.key,
    required Future<List<String>> statuses,
  }) : _statuses = statuses;

  final Future<List<String>> _statuses;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: _statuses,
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done ) {
            return StaggeredGridView.countBuilder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final String statusPath  = snapshot.data![index];
                if(statusPath.endsWith(JPG)) {
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