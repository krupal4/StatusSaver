import '../common.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {

  @override
  void initState() {
    super.initState();
    log('init of saved');
  }

  @override
  Widget build(BuildContext context) {
    log("build of recent");
    return const Placeholder();
  }
}