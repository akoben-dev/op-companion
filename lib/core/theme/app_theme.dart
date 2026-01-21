// lib/core/theme/app_theme.dart
import 'package:flutter/material.dart';
import 'one_piece_colors.dart';

ThemeData buildOnePieceDarkTheme() {
  const scheme = ColorScheme(
    brightness: Brightness.dark,

    // Main accent: straw-hat gold (buttons, FAB, active icons)
    primary: OnePieceColors.strawGold,
    onPrimary: Colors.black,

    // Secondary accent: navy (chips, outlines, less prominent actions)
    secondary: OnePieceColors.navyInk,
    onSecondary: OnePieceColors.boneWhite,

    // Neutral dark canvas, NOT maroon
    background: OnePieceColors.deepBackground,
    onBackground: OnePieceColors.boneWhite,

    // Cards, app bars, bottom nav, etc.
    surface: OnePieceColors.surfaceDark,
    onSurface: OnePieceColors.boneWhite,

    error: Color(0xFFFF4B4B),
    onError: Colors.black,
  );

  final baseText = Typography.englishLike2018.apply(
    fontFamily: 'Roboto',
    bodyColor: scheme.onBackground,
    displayColor: scheme.onBackground,
  );

  final textTheme = baseText.copyWith(
    titleLarge: baseText.titleLarge?.copyWith(
      fontWeight: FontWeight.w700,
      letterSpacing: 0.2,
    ),
    titleMedium: baseText.titleMedium?.copyWith(
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: baseText.bodyMedium?.copyWith(
      height: 1.4,
    ),
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    textTheme: textTheme,

    scaffoldBackgroundColor: OnePieceColors.deepBackground,

    appBarTheme: AppBarTheme(
      backgroundColor: OnePieceColors.surfaceDark,
      foregroundColor: OnePieceColors.boneWhite,
      elevation: 0,
      centerTitle: false,
    ),

    cardTheme: CardTheme(
      color: OnePieceColors.surfaceDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 2,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: OnePieceColors.strawGold,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    ),

    listTileTheme: ListTileThemeData(
      iconColor: OnePieceColors.strawGold,
      textColor: OnePieceColors.boneWhite,
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: OnePieceColors.surfaceDark,
      selectedItemColor: OnePieceColors.strawGold,
      unselectedItemColor: OnePieceColors.boneWhite.withOpacity(0.6),
      type: BottomNavigationBarType.fixed,
    ),

    dividerTheme: DividerThemeData(
      color: OnePieceColors.navyInk.withOpacity(0.5),
      thickness: 1,
    ),
  );
}
