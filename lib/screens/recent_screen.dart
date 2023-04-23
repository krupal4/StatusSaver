import 'package:status_saver/common.dart';
import 'package:status_saver/widgets/statuses_list.dart';

class RecentScreen extends StatefulWidget {
  final Future<List<String>> statuses;
  const RecentScreen({super.key, required this.statuses});

  @override
  State<RecentScreen> createState() => _RecentScreenState();
}

class _RecentScreenState extends State<RecentScreen> {

  @override
  Widget build(BuildContext context) {
    return StatusesList(statuses: widget.statuses);
  }
}