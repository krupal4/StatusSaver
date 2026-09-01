// ignore_for_file: deprecated_member_use

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_color_utilities/palettes/core_palette.dart';
import 'package:status_saver/src/theme/colors.dart';
import 'package:status_saver/src/theme/tokens.dart';
import 'package:status_saver/src/theme/typography.dart';

class AppTheme {
  static ThemeData themeData(CorePalette? corePalette, Brightness brightness) {
    final ColorScheme scheme = _colorScheme(corePalette, brightness);
    final TextTheme textTheme = AppTypography.textTheme(scheme);
    final bool isDark = brightness == Brightness.dark;
    final BorderRadius pill = BorderRadius.circular(AppRadii.lg);

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      textTheme: textTheme,
      fontFamily: AppTypography.family,
      scaffoldBackgroundColor: scheme.surface,
      canvasColor: scheme.surface,
      splashFactory: InkSparkle.splashFactory,
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: textTheme.headlineMedium,
        systemOverlayStyle: overlayStyle(brightness),
      ),
      navigationBarTheme: NavigationBarThemeData(
        height: 68,
        elevation: 0,
        backgroundColor: scheme.surfaceContainerHighest,
        indicatorColor: scheme.primary.withValues(alpha: 0.22),
        surfaceTintColor: Colors.transparent,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final TextStyle style = textTheme.labelMedium!;
          if (states.contains(WidgetState.selected)) {
            return style.copyWith(color: scheme.primary);
          }
          return style.copyWith(color: scheme.onSurfaceVariant);
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          final Color color = states.contains(WidgetState.selected)
              ? scheme.primary
              : scheme.onSurfaceVariant;
          return IconThemeData(size: 24, color: color);
        }),
      ),
      chipTheme: ChipThemeData(
        side: BorderSide.none,
        shape: RoundedRectangleBorder(borderRadius: pill),
        selectedColor: scheme.primary.withValues(alpha: 0.22),
        backgroundColor: scheme.surfaceContainerHighest,
        labelStyle: textTheme.labelLarge,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xxs,
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: scheme.surfaceContainerHigh,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.lg),
        ),
        titleTextStyle: textTheme.titleLarge,
        contentTextStyle: textTheme.bodyMedium?.copyWith(
          color: scheme.onSurfaceVariant,
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: scheme.surfaceContainerHigh,
        surfaceTintColor: Colors.transparent,
        showDragHandle: true,
        dragHandleColor: scheme.outline,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppRadii.xl),
          ),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: isDark ? AppColors.surfaceHigh : scheme.inverseSurface,
        contentTextStyle: textTheme.bodyMedium?.copyWith(
          color: isDark ? scheme.onSurface : scheme.onInverseSurface,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.sm),
        ),
        elevation: 0,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          textStyle: textTheme.labelLarge,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadii.md),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: scheme.primary,
          textStyle: textTheme.labelLarge,
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: scheme.onSurface,
        ),
      ),
      dividerTheme: DividerThemeData(
        color: scheme.outlineVariant,
        space: 1,
        thickness: AppStroke.hairline,
      ),
      listTileTheme: ListTileThemeData(
        iconColor: scheme.onSurfaceVariant,
        titleTextStyle: textTheme.titleMedium,
        subtitleTextStyle: textTheme.bodySmall?.copyWith(
          color: scheme.onSurfaceVariant,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.sm),
        ),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: scheme.primary,
      ),
      cardTheme: CardThemeData(
        color: scheme.surfaceContainerHighest,
        elevation: 0,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.md),
        ),
      ),
    );
  }

  static SystemUiOverlayStyle overlayStyle(Brightness brightness) {
    final bool isDark = brightness == Brightness.dark;
    return SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
      systemNavigationBarColor:
          isDark ? AppColors.canvas : AppColors.canvasLight,
      systemNavigationBarIconBrightness:
          isDark ? Brightness.light : Brightness.dark,
    );
  }

  static SystemUiOverlayStyle get cinemaOverlay => const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: AppColors.cinemaBlack,
        systemNavigationBarIconBrightness: Brightness.light,
      );

  static ColorScheme _colorScheme(CorePalette? corePalette, Brightness brightness) {
    final bool isDark = brightness == Brightness.dark;
    ColorScheme scheme = ColorScheme.fromSeed(
      seedColor: AppColors.emerald,
      brightness: brightness,
    ).copyWith(
      surface: isDark ? AppColors.canvas : AppColors.canvasLight,
      onSurface: isDark ? const Color(0xFFF2F5F3) : const Color(0xFF121816),
      surfaceContainerHighest:
          isDark ? AppColors.surfaceHigh : const Color(0xFFE6EEE9),
      surfaceContainerHigh:
          isDark ? AppColors.surface : const Color(0xFFECF2EE),
      outline: isDark ? AppColors.outlineDark : AppColors.outlineLight,
      outlineVariant: isDark
          ? const Color(0xFF2A332F)
          : const Color(0xFFD5DED9),
      primary: isDark ? AppColors.emerald : AppColors.emeraldDim,
      onPrimary: isDark ? AppColors.onEmerald : Colors.white,
    );

    if (corePalette != null) {
      final ColorScheme dynamicScheme =
          corePalette.toColorScheme(brightness: brightness);
      scheme = scheme.copyWith(
        primary: Color.lerp(scheme.primary, dynamicScheme.primary, 0.28)!,
        secondary: Color.lerp(scheme.secondary, dynamicScheme.secondary, 0.28)!,
        tertiary: Color.lerp(scheme.tertiary, dynamicScheme.tertiary, 0.28)!,
      );
    }

    return scheme;
  }
}
