import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_color_utilities/palettes/core_palette.dart';
import 'package:status_saver/common.dart';
import 'package:status_saver/screens/home_screen.dart';
import 'package:status_saver/theme/app_theme.dart';

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
    _preloadRequiredData(ref);
    ColorScheme? lightColorScheme;
    ColorScheme? darkColorScheme;
    if (corePalette != null) {
      lightColorScheme = corePalette?.toColorScheme();
      darkColorScheme = corePalette?.toColorScheme(brightness: Brightness.dark);
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

  void _preloadRequiredData(WidgetRef ref) {
    ref.read(storagePermissionProvider.notifier).initialize();
  }
}