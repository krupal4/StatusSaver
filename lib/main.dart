import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:status_saver/common.dart';
import 'package:status_saver/provider/locale_provider.dart';
import 'package:status_saver/provider/storage_permission_provider.dart';
import 'package:status_saver/provider/theme_provider.dart';
import 'package:status_saver/screens/home_screen.dart';
import 'package:status_saver/theme/app_theme.dart';
import 'package:status_saver/screens/pre_loading_screen.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

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
          ChangeNotifierProvider<LocaleProvider>(
              create: (context) => LocaleProvider()..initialize()),
          ChangeNotifierProvider<ThemeModeProvider>(
              create: (context) => ThemeModeProvider()..initialize()),
          ChangeNotifierProvider<StoragePermissionProvider>(
              create: (context) => StoragePermissionProvider()..initialize())
        ],
        builder: (context, child) {
          final localeProvider = context.watch<LocaleProvider>();
          final themeModeProvider = context.watch<ThemeModeProvider>();
          return FutureBuilder<CorePalette?>(
            future: DynamicColorPlugin.getCorePalette(),
            builder: (context, snapshot) {
              log(snapshot.connectionState.toString());
              if (snapshot.connectionState == ConnectionState.done) {
                final color = snapshot.data;
                ColorScheme? lightColorScheme;
                ColorScheme? darkColorScheme;
                if (color != null) {
                  CorePalette corePalette = color;
                  lightColorScheme = corePalette.toColorScheme();
                  darkColorScheme =
                      corePalette.toColorScheme(brightness: Brightness.dark);
                }
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
                  theme: AppTheme.lightTheme(lightColorScheme),
                  darkTheme: AppTheme.darkTheme(darkColorScheme),
                  home: const HomeScreen(),
                );
              } else {
                return const Loading();
              }
            },
          );
        });
  }
}
