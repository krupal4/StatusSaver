import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:status_saver/constants.dart';
import 'package:status_saver/screens/home_screen.dart';
import 'common.dart';
import 'colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final AndroidDeviceInfo androidInfo = await DeviceInfoPlugin().androidInfo;
  if (androidInfo.version.sdkInt >= 30) {
    log('it is android 11');
    // Android 11 or greater
    recentDirectoryPaths = [
      "/storage/emulated/0/Android/media/com.whatsapp/WhatsApp/Media/.Statuses",
      "/storage/emulated/0/Android/media/com.whatsapp.w4b/WhatsApp Business/Media/.Statuses"
    ];
  } else {
    log('it is not android 11');
    recentDirectoryPaths = [
      "/storage/emulated/0/WhatsApp/Media/.Statuses",
      "/storage/emulated/0/WhatsApp Business/Media/.Statuses"
    ];
  }

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
      theme: themeData(),
      darkTheme: darkThemeData(),
      home: const HomeScreen(),
    );
  }

  ThemeData themeData() {
    return ThemeData(
      primarySwatch: primarySwatch,
      appBarTheme: const AppBarTheme(
        color: primarySwatch,
        titleTextStyle: TextStyle(
          color: textColor,
          fontSize: 22
          )
      ),
      tabBarTheme: const TabBarTheme(
        indicator: UnderlineTabIndicator(
          insets: EdgeInsets.symmetric(horizontal: 13),
          borderSide: BorderSide(color: indicatorColor, width: 2.5)
        ),
        labelColor: labelColor,
        indicatorColor: indicatorColor
      ),
    );
  }

  ThemeData darkThemeData() {
    return ThemeData.dark().copyWith(
      appBarTheme: const AppBarTheme(
        color: darkPrimarySwatch,
        titleTextStyle: TextStyle(
          color: darkTextColor,
          fontSize: 22
          )
      ),
      tabBarTheme: const TabBarTheme(
        indicator: UnderlineTabIndicator(
          insets: EdgeInsets.symmetric(horizontal: 13),
          borderSide: BorderSide(color: darkIndicatorColor, width: 2.5)
        ),
        labelColor: darkLabelColor,
        indicatorColor: darkIndicatorColor
      )
    );
  }
}

