import 'package:status_saver/common.dart';
import 'package:status_saver/screens/not_found_screen.dart';

class DoOrDie extends StatelessWidget {
  final Future<bool> Function() directoryExists;
  final Widget Function() onExists;
  final String notExistsMessage;
  const DoOrDie({
    super.key, 
    required this.directoryExists, 
    required this.onExists, 
    required this.notExistsMessage
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: directoryExists(),
      builder: (_,snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          if(snapshot.data!) {
            return onExists();
          }
          return NotFoundScreen(message: notExistsMessage);
        } else {
          // TODO: return effective progress bar
          return const Center(child: CircularProgressIndicator());
        }
      }
    );
  }
}