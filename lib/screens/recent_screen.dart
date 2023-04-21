import 'dart:io';

import 'package:status_saver/services/get_statuses.dart';
import 'package:status_saver/widgets/image_tile.dart';
import 'package:status_saver/common.dart';
import 'package:status_saver/widgets/video_tile.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class RecentScreen extends StatefulWidget {
  const RecentScreen({super.key});

  @override
  State<RecentScreen> createState() => _RecentScreenState();
}

class _RecentScreenState extends State<RecentScreen> {

  late Future<List<FileSystemEntity>> _statuses;

  @override
  void initState() {
    super.initState();
    _statuses = getStatuses();
    log('init of recebt');
  }

  @override
  Widget build(BuildContext context) {
    log("build of recent");
    return FutureBuilder<List<FileSystemEntity>>(
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
                final String statusPath  = snapshot.data![index].path;
                if(statusPath.endsWith('.jpg')) {
                  return ImageTile(imagePath: statusPath);
                } else {
                  return VideoTile(videoPath: statusPath);
                }
              }
            );
        } else if(snapshot.connectionState == ConnectionState.waiting) {
          log('In progress bar');
          return const Center(child: CircularProgressIndicator(color: Colors.black,),);
        } else {
          log('Some thing went wrong Please restart app');
          return const Text('Something went wrong restart app');
        }
      }
    );
  }
}