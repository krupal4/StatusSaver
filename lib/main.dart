import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:status_saver/common.dart';
import 'package:status_saver/l10n/l10n.dart';
import 'package:status_saver/provider/theme_provider.dart';
import 'package:status_saver/screens/home_screen.dart';
import 'package:status_saver/provider/locale_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LocaleProvider>(create: (context) => LocaleProvider()..initialize()),
        ChangeNotifierProvider<ThemeModeProvider>(create: (context) => ThemeModeProvider()..initialize())
      ],
      builder: (context,child) {
        final localeProvider = Provider.of<LocaleProvider>(context);
        final themeModeProvider = Provider.of<ThemeModeProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Whatsapp Status Saver',
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            AppLocalizations.delegate
          ],
          locale: localeProvider.locale,
          supportedLocales: AppLocalizations.supportedLocales,
          themeMode: themeModeProvider.themeMode,
          theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.light,
            colorSchemeSeed: Colors.green[700],
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            colorSchemeSeed: Colors.green[700],
          ),
          home: const HomeScreen(),
        );
      }
    );
  }
}
