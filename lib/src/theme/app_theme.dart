import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:material_color_utilities/palettes/core_palette.dart';

class AppTheme {
  static ThemeData themeData(CorePalette? corePalette, Brightness brightness) {
    ColorScheme scheme = corePalette?.toColorScheme(brightness: brightness) ?? defaultColorScheme(brightness);
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
    );
  }

  static ColorScheme defaultColorScheme(Brightness brightness) {
    return ColorScheme.fromSeed(
        seedColor: const Color(0xFF00FF00), brightness: brightness);
  }
}
