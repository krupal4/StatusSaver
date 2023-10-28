import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_color_utilities/palettes/core_palette.dart';
import 'package:status_saver/common.dart';
import 'package:status_saver/screens/home_screen.dart';
import 'package:status_saver/theme/app_theme.dart';

import 'screens/splash_screen.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  CorePalette? corePalette = await DynamicColorPlugin.getCorePalette();
  FlutterNativeSplash.remove();
  runApp(ProviderScope(child: MyApp(corePalette: corePalette)));
}

class MyApp extends ConsumerWidget {
  final CorePalette? corePalette;
  const MyApp({super.key, this.corePalette});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme? lightColorScheme;
    ColorScheme? darkColorScheme;
    if (corePalette != null) {
      lightColorScheme = corePalette?.toColorScheme();
      darkColorScheme = corePalette?.toColorScheme(brightness: Brightness.dark);
    }
    return FutureBuilder<void>(
      future: _preloadRequiredData(ref),
      builder: (context, snapshot) {
        if(snapshot.connectionState != ConnectionState.done) {
          return const SplashScreen();
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
          locale: ref.watch(localeProvider),
          supportedLocales: AppLocalizations.supportedLocales,
          themeMode: ref.watch(themeModeProvider),
          theme: AppTheme.lightTheme(lightColorScheme),
          darkTheme: AppTheme.darkTheme(darkColorScheme),
          home: const HomeScreen(),
        );
      }
    );
  }

  Future<void> _preloadRequiredData(WidgetRef ref) async {
    await ref.read(storagePermissionProvider.notifier).initialize();
    await ref.read(localeProvider.notifier).initialize();
    await ref.read(themeModeProvider.notifier).initialize();
    await ref.read(recentStatusesProvider.notifier).initialize();
    await ref.read(savedStatusesProvider.notifier).initialize();
  }
}