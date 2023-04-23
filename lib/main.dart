import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:status_saver/screens/home_screen.dart';
import 'common.dart';
import 'colors.dart';

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

