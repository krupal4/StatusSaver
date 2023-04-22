import 'dart:io';

import 'package:status_saver/services/get_statuses.dart';
import 'package:status_saver/common.dart';
import 'package:status_saver/services/is_directory_exists.dart';
import 'package:status_saver/widgets/statuses_list.dart';
import 'package:status_saver/screens/not_found_screen.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {

  late Future<bool> _directoryExists;
  late Future<List<FileSystemEntity>> _savedStatuses;
  final List<String> _directoryPaths = [];

  @override
  void initState() {
    super.initState();
    _savedStatuses = getStatuses(
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
            return StatusesList(statuses: _savedStatuses);
          } else {
            return const NotFoundScreen(message: "Saved statuses Not found");
          }
        } else {
          // TODO return effective progress bar
          return const Center(child: CircularProgressIndicator());
        }
      }
    );
  }
}