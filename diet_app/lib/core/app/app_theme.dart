import 'package:flutter/material.dart';

class Spacing {
  static const double twoXSmall = 4.0; // 2xSmall
  static const double xSmall = 8.0; // xSmall
  static const double small = 12.0; // small
  static const double medium = 16.0; // medium [Base Size]
  static const double large = 20.0; // large
  static const double xLarge = 24.0; // xLarge
  static const double twoXLarge = 32.0; // 2xLarge
}

class Sizes {
  static const double twoXSmall = 4.0; // Very small UI elements
  static const double xSmall = 8.0; // Extra small size
  static const double small = 12.0; // Small size
  static const double medium = 16.0; // Base medium size [Base Size]
  static const double large = 20.0; // Large size
  static const double xLarge = 24.0; // Extra large size
  static const double twoXLarge = 32.0; // 2x Extra large size
  static const double threeXLarge = 40.0; // 3x Extra large size
  static const double fourXLarge = 48.0; // 4x Extra large size
  static const double fiveXLarge = 56.0; // 5x Extra large size
  static const double sixXLarge = 64.0; // 6x Extra large size
  static const double sevenXLarge = 72.0; // 7x Extra large size
  static const double eightXLarge = 80.0; // 8x Extra large size
  static const double nineXLarge = 88.0; // 9x Extra large size
  static const double tenXLarge = 96.0; // 10x Extra large size
  static const double elevenXLarge =
      100.0; // 11x Extra large size, reaching 100
}

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF7E57C2), // clean purple
      surfaceTint: Color(0xFF9575CD), // slightly lighter
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFFD1C4E9), // soft container tone
      onPrimaryContainer: Color(0xFF311B92),

      secondary: Color(0xFFB388FF), // light lilac
      onSecondary: Color(0xFF2E006C),
      secondaryContainer: Color(0xFFEDE7F6),
      onSecondaryContainer: Color(0xFF311B92),

      tertiary: Color(0xFF9575CD), // complements the main tone
      onTertiary: Color(0xFFFFFFFF),
      tertiaryContainer: Color(0xFFD1C4E9),
      onTertiaryContainer: Color(0xFF2E006C),

      error: Color(0xFFB00020),
      onError: Color(0xFFFFFFFF),
      errorContainer: Color(0xFFFCDADA),
      onErrorContainer: Color(0xFF410002),

      surface: Color(0xFFFFFFFF),
      onSurface: Color(0xFF1C1C1A),
      onSurfaceVariant: Color(0xFF46464F),
      outline: Color(0xFF7A7A84),
      outlineVariant: Color(0xFFC5C7BF),

      shadow: Color(0x1F000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFF2E2E30),
      inversePrimary: Color(0xFFB39DDB),

      primaryFixed: Color(0xFFB39DDB),
      onPrimaryFixed: Color(0xFF1C004D),
      primaryFixedDim: Color(0xFF9575CD),
      onPrimaryFixedVariant: Color(0xFF4A148C),

      secondaryFixed: Color(0xFFD1C4E9),
      onSecondaryFixed: Color(0xFF2E006C),
      secondaryFixedDim: Color(0xFFB388FF),
      onSecondaryFixedVariant: Color(0xFF4A148C),

      tertiaryFixed: Color(0xFFEDE7F6),
      onTertiaryFixed: Color(0xFF2E006C),
      tertiaryFixedDim: Color(0xFFD1C4E9),
      onTertiaryFixedVariant: Color(0xFF4A148C),

      surfaceDim: Color(0xFFF5F5F5),
      surfaceBright: Color(0xFFFFFFFF),
      surfaceContainerLowest: Color(0xFFFFFFFF),
      surfaceContainerLow: Color(0xFFF6F3F1),
      surfaceContainer: Color(0xFFF0EDEF),
      surfaceContainerHigh: Color(0xFFEAE8E5),
      surfaceContainerHighest: Color(0xFFE5E2E0),
    );
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFFB39DDB), // lighter for contrast
      surfaceTint: Color(0xFF9575CD),
      onPrimary: Color(0xFF2E006C),
      primaryContainer: Color(0xFF4A148C), // deep purple container
      onPrimaryContainer: Color(0xFFEDE7F6),

      secondary: Color(0xFFD1C4E9),
      onSecondary: Color(0xFF311B92),
      secondaryContainer: Color(0xFF512DA8),
      onSecondaryContainer: Color(0xFFEDE7F6),

      tertiary: Color(0xFFB388FF),
      onTertiary: Color(0xFF2E006C),
      tertiaryContainer: Color(0xFF5E35B1),
      onTertiaryContainer: Color(0xFFEDE7F6),

      error: Color(0xFFF2B8B5),
      onError: Color(0xFF601410),
      errorContainer: Color(0xFF8C1D18),
      onErrorContainer: Color(0xFFF9DEDC),

      surface: Color(0xFF121212),
      onSurface: Color(0xFFE4E1E6),
      onSurfaceVariant: Color(0xFFC7C5D0),
      outline: Color(0xFF938F99),
      outlineVariant: Color(0xFF49454F),

      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFFE4E1E6),
      inversePrimary: Color(0xFF7E57C2),

      primaryFixed: Color(0xFF9575CD),
      onPrimaryFixed: Color(0xFF2E006C),
      primaryFixedDim: Color(0xFF7E57C2),
      onPrimaryFixedVariant: Color(0xFFEDE7F6),

      secondaryFixed: Color(0xFFB39DDB),
      onSecondaryFixed: Color(0xFF2E006C),
      secondaryFixedDim: Color(0xFF9575CD),
      onSecondaryFixedVariant: Color(0xFFEDE7F6),

      tertiaryFixed: Color(0xFFD1C4E9),
      onTertiaryFixed: Color(0xFF2E006C),
      tertiaryFixedDim: Color(0xFFB388FF),
      onTertiaryFixedVariant: Color(0xFFEDE7F6),

      surfaceDim: Color(0xFF1C1B1F),
      surfaceBright: Color(0xFF2B2930),
      surfaceContainerLowest: Color(0xFF0F0E11),
      surfaceContainerLow: Color(0xFF18171B),
      surfaceContainer: Color(0xFF1C1B1F),
      surfaceContainerHigh: Color(0xFF25242A),
      surfaceContainerHighest: Color(0xFF2E2C32),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
  );
}

TextStyle headlineTextStyle(Color color) =>
    TextStyle(fontSize: Sizes.xLarge, color: color, fontFamily: "Inter");

TextStyle headlineBoldTextStyle(Color color) => TextStyle(
  fontSize: Sizes.xLarge,
  color: color,
  fontFamily: "Inter",
  fontWeight: FontWeight.bold,
);

TextStyle titleTextStyle(Color color) =>
    TextStyle(fontSize: Sizes.large, fontFamily: "Inter", color: color);

TextStyle titleBoldTextStyle(Color color) => TextStyle(
  fontSize: Sizes.large,
  color: color,
  fontFamily: "Inter",
  fontWeight: FontWeight.bold,
);

TextStyle subTitleTextStyle(Color color) =>
    TextStyle(fontSize: Sizes.medium, color: color, fontFamily: "Inter");

TextStyle subTitleBoldTextStyle(Color color) => TextStyle(
  fontSize: Sizes.medium,
  color: color,
  fontFamily: "Inter",
  fontWeight: FontWeight.bold,
);

TextStyle labelTextStyle(Color color) =>
    TextStyle(fontSize: Sizes.small, fontFamily: "Inter", color: color);

TextStyle labelBoldTextStyle(Color color) => TextStyle(
  fontSize: Sizes.small,
  color: color,
  fontFamily: "Inter",
  fontWeight: FontWeight.bold,
);

const Color lightGrey = Color(0xEEEEEEFF);

const Color greyCol = Color(0xf593959c);

const Color inversePrimary = Color(0xff97a8c5);
