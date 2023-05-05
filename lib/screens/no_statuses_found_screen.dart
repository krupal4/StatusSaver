import 'package:status_saver/common.dart';
import 'package:status_saver/services/launch_whatsapp.dart';

class NoStatusesFoundScreen extends StatelessWidget {
  const NoStatusesFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // TODO localization
        const Text("You don't have statuses go and watch some",style: TextStyle(fontSize: 20),),
        TextButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              // TODO GIVE WHATSAPP ICON
              Icon(Icons.people, size: 40,), 
              Text('Open Whats app',),
            ],
          ),
          onPressed: () async => await launchWhatsapp(),
        )
      ],
    );
  }
}