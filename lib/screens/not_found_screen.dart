import 'package:status_saver/common.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message, style: const TextStyle(fontSize: 20)) 
    );
  }
}