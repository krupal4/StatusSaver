import 'dart:io';

import 'package:status_saver/constants.dart';
import 'package:status_saver/services/get_statuses.dart';
import 'package:status_saver/common.dart';
import 'package:status_saver/services/is_directory_exists.dart';
import 'package:status_saver/widgets/statuses_list.dart';
import 'package:status_saver/screens/not_found_screen.dart';

class RecentScreen extends StatefulWidget {
  const RecentScreen({super.key});

  @override
  State<RecentScreen> createState() => _RecentScreenState();
}

class _RecentScreenState extends State<RecentScreen> {

  late Future<bool> _directoryExists;
  late Future<List<FileSystemEntity>> _recentStatuses;
  final List<String> _directoryPaths = [whatsAppStatusesLocalPath,whatsAppBusinessStatusesLocalPath];

  @override
  void initState() {
    super.initState();
    _recentStatuses = getStatuses(
      directoryPaths : _directoryPaths);
    _directoryExists = isDirectoryExists(directoriesPath:_directoryPaths);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _directoryExists,
      builder: (context,snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          if(snapshot.data!) {
            return StatusesList(statuses: _recentStatuses);
          } else {
            return const NotFoundScreen(message: "Whatsapp or W4B Not found");
          }
        } else {
          // TODO return effective progress bar
          return const Center(child: CircularProgressIndicator());
        }
      }
    );
  }
}