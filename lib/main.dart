import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:status_saver/screens/home_screen.dart';
import 'common.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whatsapp Status Saver',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate
      ],
      supportedLocales: const [
        Locale("en"), // English
        Locale("hi"), // Hindi
        Locale("gu"), // Gujarati
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
