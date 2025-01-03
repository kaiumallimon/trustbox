import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrustboxTheme {
  // light theme
  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      fontFamily: GoogleFonts.inter().fontFamily,
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: const Color(0xFF63A002),
        primary: const Color(0xFF4c662b),
        onPrimary: const Color(0xFFffffff),
        primaryContainer: const Color(0xFFcdeda3),
        onPrimaryContainer: const Color(0xFF102000),
        secondary: const Color(0xFF586249),
        onSecondary: const Color(0xFFffffff),
        secondaryContainer: const Color(0xFFdce7c8),
        onSecondaryContainer: const Color(0xFF151e0b),
        tertiary: const Color(0xFF386663),
        onTertiary: const Color(0xFFffffff),
        tertiaryContainer: const Color(0xFFbcece7),
        onTertiaryContainer: const Color(0xFF00201e),
        error: const Color(0xFFba1a1a),
        onError: const Color(0xFFffffff),
        errorContainer: const Color(0xFFffdad6),
        onErrorContainer: const Color(0xFF2a0f0f),
        surface: const Color(0xFFf9faef),
        onSurface: const Color(0xFF1a1c16),
        surfaceContainer: const Color(0xFFeeefe3),
        onSurfaceVariant: const Color(0xFF44483d),
        inversePrimary: const Color(0xFFb1d18a),
        inverseSurface: const Color(0xFF2f312a),
        outline: const Color(0xFF75796c),
      ));

  // dark theme
  ThemeData getDarkTheme() => ThemeData(
      useMaterial3: true,
      fontFamily: GoogleFonts.inter().fontFamily,
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.light,
        seedColor: const Color(0xFF63A002),
        primary: const Color(0xFFb1d18a),
        onPrimary: const Color(0xFF1f3701),
        primaryContainer: const Color(0xFF354e16),
        onPrimaryContainer: const Color(0xFFcdeda3),
        secondary: const Color(0xFFbfcbad),
        onSecondary: const Color(0xFF2a331e),
        secondaryContainer: const Color(0xFF404a33),
        onSecondaryContainer: const Color(0xFFdce7c8),
        tertiary: const Color(0xFFa0d0cb),
        onTertiary: const Color(0xFF003735),
        tertiaryContainer: const Color(0xFF1f4e4b),
        onTertiaryContainer: const Color(0xFFbcece7),
        error: const Color(0xFFffb4ab),
        onError: const Color(0xFF690005),
        errorContainer: const Color(0xFF93000a),
        onErrorContainer: const Color(0xFFffdad6),
        surface: const Color(0xFF12140e),
        onSurface: const Color(0xFFe2e3d8),
        surfaceContainer: const Color(0xFF1e201a),
        onSurfaceVariant: const Color(0xFFc5c8ba),
        inversePrimary: const Color(0xFF4c662b),
        inverseSurface: const Color(0xFFe2e3d8),
        outline: const Color(0xFF8f9285),
      ));
}
