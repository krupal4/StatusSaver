import 'package:shared_preferences/shared_preferences.dart';
import 'package:status_saver/common.dart';
import 'package:status_saver/constants.dart';
import 'package:status_saver/services/show_without_ui_block_message.dart';

class ThemeModeProvider extends ChangeNotifier {

  ThemeMode? _themeMode;

  void initialize() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    String? themeModeType = sharedPreferences.getString(themeModeTypeKey);
    _themeMode = _getThemeMode(themeModeType);
    notifyListeners();
  }

  void setThemeMode(ThemeMode? themeMode) {
    SharedPreferences.getInstance().then((sharedPreferences) {
      final themeModeType = _getThemeModeType(themeMode);
      sharedPreferences.setString(themeModeTypeKey,themeModeType ?? emptyString)
      .then((value) {
        if(!value) {
          showMessageWithoutUiBlock(message: 'Could not save your language preference'); // TODO: localize
        }
      });
    });
    _themeMode = themeMode;
    notifyListeners();
  }

  static ThemeMode _getThemeMode(String? themeModeType) {
    switch(themeModeType) {
      case 'light': return ThemeMode.light;
      case 'dark': return ThemeMode.dark;
    }
    return ThemeMode.system;
  }

  static String _getThemeModeType(ThemeMode? themeMode) {
    switch(themeMode) {
      case ThemeMode.light: return "light";
      case ThemeMode.dark: return "dark";
      case ThemeMode.system: default: return "system";
    }
  }

  ThemeMode? get themeMode => _themeMode;
}

class MyThemes {

  static List<ThemeMode> themeModes = [
    ThemeMode.system,
    ThemeMode.light,
    ThemeMode.dark,
  ];

  static List<String> themeModeTypes = [
    "System Theme",
    "Light Theme",
    "Dark Theme"
  ];

  static List<Icon> themeModeIcons = const [
    Icon(Icons.hotel_class),
    Icon(Icons.light_mode),
    Icon(Icons.dark_mode),
  ];
}