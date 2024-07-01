import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:status_saver/src/localization/extensions/on_build_context.dart';
import 'package:status_saver/src/common/helpers/show_toast.dart';

const themeModeTypeKey = "themeData";

class ThemeModeNotifier extends StateNotifier<ThemeMode?> {
  ThemeModeNotifier() : super(null);

  void initialize() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    String? themeModeType = sharedPreferences.getString(themeModeTypeKey);
    state = _getThemeMode(themeModeType);
  }

  void setThemeMode(ThemeMode? themeMode, BuildContext context) {
    SharedPreferences.getInstance().then((sharedPreferences) {
      final themeModeType = _getThemeModeType(themeMode);
      sharedPreferences
          .setString(themeModeTypeKey, themeModeType)
          .then((value) {
        if (!value) {
          showToast(message: context.l10n.couldNotSaveYourThemePreference);
        }
      });
    });
    state = themeMode;
  }

  static ThemeMode _getThemeMode(String? themeModeType) {
    switch (themeModeType) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
    }
    return ThemeMode.system;
  }

  static String _getThemeModeType(ThemeMode? themeMode) {
    switch (themeMode) {
      case ThemeMode.light:
        return "light";
      case ThemeMode.dark:
        return "dark";
      case ThemeMode.system:
      default:
        return "system";
    }
  }

  ThemeMode? get themeMode => state;
}

class MyThemes {
  static List<ThemeMode> themeModes = [
    ThemeMode.system,
    ThemeMode.light,
    ThemeMode.dark,
  ];

  static List<String> themeModeTypes(BuildContext context) => [
        context.l10n.systemThemeLabel,
        context.l10n.lightThemeLabel,
        context.l10n.darkThemeLabel
      ];

  static List<Icon> themeModeIcons = const [
    Icon(Icons.hotel_class),
    Icon(Icons.light_mode),
    Icon(Icons.dark_mode),
  ];
}

final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode?>(
    (ref) => ThemeModeNotifier()..initialize());
