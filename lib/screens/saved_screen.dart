import 'dart:io';

import 'package:status_saver/constants.dart';
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
  final List<String> _directoryPaths = [ savedStatusesDirectory ];

  @override
  void initState() {
    super.initState();
    _directoryExists = isDirectoryExists(directoriesPath:_directoryPaths)
    .then((isExists) {
      if(isExists) {
        _savedStatuses = getStatuses(directoryPaths: _directoryPaths);
        return true;
      }
      return false;
    });
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
            return NotFoundScreen(message: AppLocalizations.of(context)?.noSavedStatusesMessage ?? "No saved statuses");
          }
        } else {
          // TODO: return effective progress bar
          return const Center(child: CircularProgressIndicator());
        }
      }
    );
  }
}