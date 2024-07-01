import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:material_color_utilities/palettes/core_palette.dart';
import 'package:status_saver/src/home/views/home_screen.dart';
import 'package:status_saver/src/localization/notifiers/locale_notifier.dart';
import 'package:status_saver/src/theme/app_theme.dart';
import 'package:status_saver/src/theme/notifiers/theme_mode_notifier.dart';

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
    return MaterialApp(
      restorationScopeId: 'app',
      title: 'Whatsapp Status Saver',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate
      ],
      locale: ref.watch(localeProvider), // TODO: revisit implementation
      supportedLocales: AppLocalizations.supportedLocales,
      themeMode: ref.watch(themeModeProvider),
      theme: AppTheme.themeData(corePalette, Brightness.light),
      darkTheme: AppTheme.themeData(corePalette, Brightness.dark),
      home: const HomeScreen(),
    );
  }
}
