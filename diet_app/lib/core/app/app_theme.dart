import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

// For Spacing and Sizes use flutter_screenutil .w .h .r .sp
class Spacing {
  static double get xxsWidth => 2.0.w;
  static double get xsWidth => 4.0.w;
  static double get sWidth => 8.0.w;
  static double get mWidth => 12.0.w;
  static double get lWidth => 16.0.w;
  static double get xlWidth => 24.0.w;
  static double get xxlWidth => 32.0.w;
  static double get xxxlWidth => 40.0.w;
  static double get xxxxlWidth => 48.0.w;

  static double get xxsHeight => 2.0.h;
  static double get xsHeight => 4.0.h;
  static double get sHeight => 8.0.h;
  static double get mHeight => 12.0.h;
  static double get lHeight => 16.0.h;
  static double get xlHeight => 24.0.h;
  static double get xxlHeight => 32.0.h;
  static double get xxxlHeight => 40.0.h;
  static double get xxxxlHeight => 48.0.h;
}

/// Dynamic typography scale with responsive sizing
class TypographyScale {
  static double get displayLarge => 36.0.sp;
  static double get displaySmall => 32.0.sp;

  static double get headlineLarge => 28.0.sp;
  static double get headlineSmall => 24.0.sp;

  static double get titleLarge => 20.0.sp;
  static double get titleSmall => 18.0.sp;

  static double get subtitleLarge => 16.0.sp;
  static double get subtitleSmall => 14.0.sp;

  static double get bodyLarge => 12.0.sp; // this is the smallest to see
  static double get bodySmall => 10.0.sp; // too small

  static double get label => 8.0.sp; // too samll
}

/// Font family
const String _fontFamily = "Lato";

/// Font Weight
const FontWeight light = FontWeight.w300;
const FontWeight regular = FontWeight.w400;
const FontWeight medium = FontWeight.w500;
const FontWeight semiBold = FontWeight.w600;
const FontWeight bold = FontWeight.w700;
const FontWeight extraBold = FontWeight.w800;

// Display styles
TextStyle displayLargeTextStyle({Color? color}) => TextStyle(
  fontSize: TypographyScale.displayLarge,
  fontFamily: _fontFamily,
  color: color,
  fontWeight: regular,
  height: 1.2,
);
TextStyle displayLargeBoldTextStyle({Color? color}) => TextStyle(
  fontSize: TypographyScale.displayLarge,
  fontFamily: _fontFamily,
  color: color,
  fontWeight: bold,
  height: 1.2,
);

TextStyle displaySmallTextStyle({Color? color}) => TextStyle(
  fontSize: TypographyScale.displaySmall,
  fontFamily: _fontFamily,
  color: color,
  fontWeight: regular,
  height: 1.2,
);
TextStyle displaySmallBoldTextStyle({Color? color}) => TextStyle(
  fontSize: TypographyScale.displaySmall,
  fontFamily: _fontFamily,
  color: color,
  fontWeight: bold,
  height: 1.2,
);

// Headline styles
TextStyle headlineLargeTextStyle({Color? color}) => TextStyle(
  fontSize: TypographyScale.headlineLarge,
  fontFamily: _fontFamily,
  color: color,
  fontWeight: regular,
  height: 1.3,
);
TextStyle headlineLargeBoldTextStyle({Color? color}) => TextStyle(
  fontSize: TypographyScale.headlineLarge,
  fontFamily: _fontFamily,
  color: color,
  fontWeight: bold,
  height: 1.3,
);

TextStyle headlineSmallTextStyle({Color? color}) => TextStyle(
  fontSize: TypographyScale.headlineSmall,
  fontFamily: _fontFamily,
  color: color,
  fontWeight: regular,
  height: 1.3,
);
TextStyle headlineSmallBoldTextStyle({Color? color}) => TextStyle(
  fontSize: TypographyScale.headlineSmall,
  fontFamily: _fontFamily,
  color: color,
  fontWeight: bold,
  height: 1.3,
);

// Title styles
TextStyle titleLargeTextStyle({Color? color}) => TextStyle(
  fontSize: TypographyScale.titleLarge,
  fontFamily: _fontFamily,
  color: color,
  fontWeight: regular,
  height: 1.4,
);
TextStyle titleLargeBoldTextStyle({Color? color}) => TextStyle(
  fontSize: TypographyScale.titleLarge,
  fontFamily: _fontFamily,
  color: color,
  fontWeight: bold,
  height: 1.4,
);

TextStyle titleSmallTextStyle({Color? color}) => TextStyle(
  fontSize: TypographyScale.titleSmall,
  fontFamily: _fontFamily,
  color: color,
  fontWeight: regular,
  height: 1.4,
);
TextStyle titleSmallBoldTextStyle({Color? color}) => TextStyle(
  fontSize: TypographyScale.titleSmall,
  fontFamily: _fontFamily,
  color: color,
  fontWeight: bold,
  height: 1.4,
);

// Subtitle styles
TextStyle subtitleLargeTextStyle({Color? color}) => TextStyle(
  fontSize: TypographyScale.subtitleLarge,
  fontFamily: _fontFamily,
  color: color,
  fontWeight: regular,
  height: 1.5,
);
TextStyle subtitleLargeBoldTextStyle({Color? color}) => TextStyle(
  fontSize: TypographyScale.subtitleLarge,
  fontFamily: _fontFamily,
  color: color,
  fontWeight: bold,
  height: 1.5,
);

TextStyle subtitleSmallTextStyle({Color? color}) => TextStyle(
  fontSize: TypographyScale.subtitleSmall,
  fontFamily: _fontFamily,
  color: color,
  fontWeight: regular,
  height: 1.5,
);
TextStyle subtitleSmallBoldTextStyle({Color? color}) => TextStyle(
  fontSize: TypographyScale.subtitleSmall,
  fontFamily: _fontFamily,
  color: color,
  fontWeight: bold,
  height: 1.5,
);

// Body styles
TextStyle bodyLargeTextStyle({Color? color}) => TextStyle(
  fontSize: TypographyScale.bodyLarge,
  fontFamily: _fontFamily,
  color: color,
  fontWeight: regular,
  height: 1.5,
);
TextStyle bodyLargeBoldTextStyle({Color? color}) => TextStyle(
  fontSize: TypographyScale.bodyLarge,
  fontFamily: _fontFamily,
  color: color,
  fontWeight: bold,
  height: 1.5,
);

TextStyle bodySmallTextStyle({Color? color}) => TextStyle(
  fontSize: TypographyScale.bodySmall,
  fontFamily: _fontFamily,
  color: color,
  fontWeight: regular,
  height: 1.5,
);
TextStyle bodySmallBoldTextStyle({Color? color}) => TextStyle(
  fontSize: TypographyScale.bodySmall,
  fontFamily: _fontFamily,
  color: color,
  fontWeight: bold,
  height: 1.5,
);

// Label styles
TextStyle labelTextStyle({Color? color}) => TextStyle(
  fontSize: TypographyScale.label,
  fontFamily: _fontFamily,
  color: color,
  fontWeight: regular,
  height: 1.6,
);
TextStyle labelBoldTextStyle({Color? color}) => TextStyle(
  fontSize: TypographyScale.label,
  fontFamily: _fontFamily,
  color: color,
  fontWeight: bold,
  height: 1.6,
);

/// Utility class for common text style patterns
class TextStyleUtils {
  /// Create a text style with custom properties
  static TextStyle custom({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    String? fontFamily,
    double? height,
    double? letterSpacing,
    TextDecoration? decoration,
  }) => TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    fontFamily: fontFamily ?? "Lato",
    height: height,
    letterSpacing: letterSpacing,
    decoration: decoration,
  );

  /// Create a gradient text style (requires ShaderMask)
  static TextStyle gradient({
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
    double? height,
    double? letterSpacing,
  }) => TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: fontFamily ?? "Lato",
    height: height,
    letterSpacing: letterSpacing,
    color: Colors.white, // This will be overridden by ShaderMask
  );
}

const Color appThemeLightGrey = Color(0xEEEEEEFF);

const Color appThemeGreyCol = Color(0xf593959c);

const Color appThemeInversePrimary = Color(0xff97a8c5);