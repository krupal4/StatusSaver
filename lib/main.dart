import 'package:flutter_localizations/flutter_localizations.dart';
import 'common.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  static const numOfTabs = 2;
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
      home: DefaultTabController(
        length: numOfTabs, 
        child: Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.appTitle),
            bottom: const TabBar(
              tabs: [
                Text("Recent"),
                Text("Saved")
            ]),
            ),
          body: const TabBarView(
            children: [
                Text("Body")
              ],
          ),
        )),
    );
  }
}
