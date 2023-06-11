import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:status_saver/common.dart';
import 'package:status_saver/notifiers/locale_notifier.dart';
import 'package:status_saver/notifiers/theme_mode_notifier.dart';
import 'package:status_saver/screens/home_screen.dart';
import 'package:status_saver/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

final localeProvider = StateNotifierProvider<LocaleNotifier, Locale?>(
    (ref) => LocaleNotifier()..initialize());
final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode?>(
    (ref) => ThemeModeNotifier()..initialize());

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DynamicColorBuilder(
        builder: (ColorScheme? lightColorScheme, ColorScheme? darkColorScheme) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Whatsapp Status Saver',
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          AppLocalizations.delegate
        ],
        locale: ref.watch(localeProvider),
        supportedLocales: AppLocalizations.supportedLocales,
        themeMode: ref.watch(themeModeProvider),
        theme: AppTheme.lightTheme(lightColorScheme),
        darkTheme: AppTheme.darkTheme(darkColorScheme),
        home: const HomeScreen(),
      );
    });
  }
}
