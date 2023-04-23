import 'package:status_saver/common.dart';
import 'package:status_saver/widgets/statuses_list.dart';

class SavedScreen extends StatefulWidget {
  final Future<List<String>> statuses;
  const SavedScreen({super.key, required this.statuses});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {

  @override
  Widget build(BuildContext context) {
    return StatusesList(statuses: widget.statuses);
  }
}