import 'package:flutter/material.dart';

class AppTypography {
  static const String family = 'PlusJakartaSans';

  static TextTheme textTheme(ColorScheme colors) {
    TextStyle base(double size, FontWeight weight, {double letterSpacing = 0}) {
      return TextStyle(
        fontFamily: family,
        fontSize: size,
        fontWeight: weight,
        letterSpacing: letterSpacing,
        color: colors.onSurface,
        height: 1.25,
      );
    }

    return TextTheme(
      displaySmall: base(28, FontWeight.w700, letterSpacing: -0.6),
      headlineMedium: base(22, FontWeight.w700, letterSpacing: -0.4),
      titleLarge: base(18, FontWeight.w600, letterSpacing: -0.2),
      titleMedium: base(16, FontWeight.w600),
      titleSmall: base(14, FontWeight.w600),
      bodyLarge: base(16, FontWeight.w400).copyWith(height: 1.45),
      bodyMedium: base(14, FontWeight.w400).copyWith(height: 1.45),
      bodySmall: base(12, FontWeight.w400).copyWith(height: 1.4),
      labelLarge: base(14, FontWeight.w600, letterSpacing: 0.1),
      labelMedium: base(12, FontWeight.w600, letterSpacing: 0.2),
      labelSmall: base(11, FontWeight.w600, letterSpacing: 0.3),
    );
  }
}
