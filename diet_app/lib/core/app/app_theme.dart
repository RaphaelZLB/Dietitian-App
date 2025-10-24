import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// For Spacing and Sizes use flutter_screenutil .w .h .r .sp
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

/// Dynamic typography scale with responsive sizing
class TypographyScale {

  /// 45px - Large display text (responsive)
  /// Usage: Section headers, feature titles, onboarding headlines
  /// Widgets: Text, RichText, AutoSizeText, FittedBox
  static double get displayMedium => 45.0.sp;
  
  /// 36px - Medium display text (responsive)
  /// Usage: Card titles, modal headers, important announcements
  /// Widgets: Text, RichText, ListTile.title, Card.title
  static double get displaySmall => 36.0.sp;

  // HEADLINE STYLES - For section headers and important text
  /// 32px - Large headlines (responsive)
  /// Usage: Page titles, major section headers, dashboard titles
  /// Widgets: Text, AppBar.title, DrawerHeader, ExpansionTile.title
  static double get headlineLarge => 32.0.sp;
  
  /// 28px - Medium headlines (responsive)
  /// Usage: Subsection headers, feature titles, form section headers
  /// Widgets: Text, ListTile.title, Card.title, ExpansionTile.title
  static double get headlineMedium => 28.0.sp;
  
  /// 24px - Small headlines (responsive)
  /// Usage: Card headers, list section titles, dialog titles
  /// Widgets: Text, ListTile.title, Dialog.title, AlertDialog.title
  static double get headlineSmall => 24.0.sp;

  // TITLE STYLES - For content titles and labels
  /// 22px - Large titles (responsive)
  /// Usage: Article titles, profile names, important labels
  /// Widgets: Text, ListTile.title, Card.title, Chip.label
  static double get titleLarge => 22.0.sp;
  
  /// 16px - Medium titles (responsive)
  /// Usage: Button text, navigation labels, form field labels
  /// Widgets: Text, ElevatedButton.child, TextButton.child, BottomNavigationBarItem.label
  static double get titleMedium => 16.0.sp;
  
  /// 14px - Small titles (responsive)
  /// Usage: Tab labels, small buttons, secondary labels
  /// Widgets: Text, Tab.label, Chip.label, Badge.label
  static double get titleSmall => 14.0.sp;

  // BODY STYLES - For main content text
  /// 16px - Large body text (responsive)
  /// Usage: Main content, descriptions, form input text
  /// Widgets: Text, TextField.style, TextFormField.style, ListTile.subtitle
  static double get bodyLarge => 16.0.sp;
  
  /// 14px - Medium body text (responsive)
  /// Usage: Secondary content, captions, helper text
  /// Widgets: Text, ListTile.subtitle, Card.content, ExpansionTile.children
  static double get bodyMedium => 14.0.sp;
  
  /// 12px - Small body text (responsive)
  /// Usage: Fine print, metadata, timestamps
  /// Widgets: Text, ListTile.trailing, Card.actions, SnackBar.content
  static double get bodySmall => 12.0.sp;
}

/// App text styles with consistent typography
// class AppTextStyles {

//   /// Font family
//   static const String _fontFamily = "Lato";

//   /// Font Weight
//   static const FontWeight light = FontWeight.w300;
//   static const FontWeight regular = FontWeight.w400;
//   static const FontWeight medium = FontWeight.w500;
//   static const FontWeight semiBold = FontWeight.w600;
//   static const FontWeight bold = FontWeight.w700;
//   static const FontWeight extraBold = FontWeight.w800;


//   /// Display style
//   static TextStyle displayTextStyle({Color? color}) => TextStyle(
//     fontSize: TypographyScale.displayMedium,
//     fontFamily: _fontFamily,
//     color: color,
//     fontWeight: regular,
//     height: 1.2,
//   );
//   static TextStyle displayBoldTextStyle({Color? color}) => TextStyle(
//     fontSize: TypographyScale.displayMedium,
//     fontFamily: _fontFamily,
//     color: color,
//     fontWeight: bold,
//     height: 1.2,
//   );

//   static TextStyle displaySmallTextStyle({Color? color}) => TextStyle(
//     fontSize: TypographyScale.displaySmall,
//     fontFamily: _fontFamily,
//     color: color,
//     fontWeight: regular,
//     height: 1.2,
//   );
//   static TextStyle displayBoldSmallTextStyle({Color? color}) => TextStyle(
//     fontSize: TypographyScale.displaySmall,
//     fontFamily: _fontFamily,
//     color: color,
//     fontWeight: bold,
//     height: 1.2,
//   );

//   // Headline styles
//   static TextStyle headlineLargeTextStyle({Color? color}) => TextStyle(
//     fontSize: TypographyScale.headlineLarge,
//     fontFamily: _fontFamily,
//     color: color,
//     fontWeight: regular,
//     height: 1.3,
//   );
//   static TextStyle headlineBoldLargeTextStyle({Color? color}) => TextStyle(
//     fontSize: TypographyScale.headlineLarge,
//     fontFamily: _fontFamily,
//     color: color,
//     fontWeight: bold,
//     height: 1.3,
//   );

//   static TextStyle headlineMediumTextStyle({Color? color}) => TextStyle(
//     fontSize: TypographyScale.headlineMedium,
//     fontFamily: _fontFamily,
//     color: color,
//     fontWeight: fontWeight ?? FontWeights.semiBold,
//     height: 1.3,
//   );

//   static TextStyle headlineSmall({Color? color, FontWeight? fontWeight}) => TextStyle(
//     fontSize: TypographyScale.headlineSmall,
//     fontFamily: _fontFamily,
//     color: color,
//     fontWeight: fontWeight ?? FontWeights.semiBold,
//     height: 1.3,
//   );

//   // Title styles
//   static TextStyle titleLarge({Color? color, FontWeight? fontWeight}) => TextStyle(
//     fontSize: TypographyScale.titleLarge,
//     fontFamily: _fontFamily,
//     color: color,
//     fontWeight: fontWeight ?? FontWeights.medium,
//     height: 1.4,
//   );

//   static TextStyle titleMedium({Color? color, FontWeight? fontWeight}) => TextStyle(
//     fontSize: TypographyScale.titleMedium,
//     fontFamily: _fontFamily,
//     color: color,
//     fontWeight: fontWeight ?? FontWeights.medium,
//     height: 1.4,
//   );

//   static TextStyle titleSmall({Color? color, FontWeight? fontWeight}) => TextStyle(
//     fontSize: TypographyScale.titleSmall,
//     fontFamily: _fontFamily,
//     color: color,
//     fontWeight: fontWeight ?? FontWeights.medium,
//     height: 1.4,
//   );

//   // Body styles
//   static TextStyle bodyLarge({Color? color, FontWeight? fontWeight}) => TextStyle(
//     fontSize: TypographyScale.bodyLarge,
//     fontFamily: _fontFamily,
//     color: color,
//     fontWeight: fontWeight ?? FontWeights.regular,
//     height: 1.5,
//   );

//   static TextStyle bodyMedium({Color? color, FontWeight? fontWeight}) => TextStyle(
//     fontSize: TypographyScale.bodyMedium,
//     fontFamily: _fontFamily,
//     color: color,
//     fontWeight: fontWeight ?? FontWeights.regular,
//     height: 1.5,
//   );

//   static TextStyle bodySmall({Color? color, FontWeight? fontWeight}) => TextStyle(
//     fontSize: TypographyScale.bodySmall,
//     fontFamily: _fontFamily,
//     color: color,
//     fontWeight: fontWeight ?? FontWeights.regular,
//     height: 1.5,
//   );

//   // Label styles
//   static TextStyle labelLarge({Color? color, FontWeight? fontWeight}) => TextStyle(
//     fontSize: TypographyScale.labelLarge,
//     fontFamily: _fontFamily,
//     color: color,
//     fontWeight: fontWeight ?? FontWeights.medium,
//     height: 1.4,
//   );

//   static TextStyle labelMedium({Color? color, FontWeight? fontWeight}) => TextStyle(
//     fontSize: TypographyScale.labelMedium,
//     fontFamily: _fontFamily,
//     color: color,
//     fontWeight: fontWeight ?? FontWeights.medium,
//     height: 1.4,
//   );

//   static TextStyle labelSmall({Color? color, FontWeight? fontWeight}) => TextStyle(
//     fontSize: TypographyScale.labelSmall,
//     fontFamily: _fontFamily,
//     color: color,
//     fontWeight: fontWeight ?? FontWeights.medium,
//     height: 1.4,
//   );

//   // Legacy compatibility methods
//   static TextStyle headlineTextStyle(Color color) => headlineLarge(color: color);
//   static TextStyle headlineBoldTextStyle(Color color) => headlineLarge(color: color, fontWeight: FontWeights.bold);
//   static TextStyle titleTextStyle(Color color) => titleMedium(color: color);
//   static TextStyle titleBoldTextStyle(Color color) => titleMedium(color: color, fontWeight: FontWeights.bold);
//   static TextStyle subTitleTextStyle(Color color) => bodyMedium(color: color);
//   static TextStyle subTitleBoldTextStyle(Color color) => bodyMedium(color: color, fontWeight: FontWeights.bold);
//   static TextStyle labelTextStyle(Color color) => labelMedium(color: color);
//   static TextStyle labelBoldTextStyle(Color color) => labelMedium(color: color, fontWeight: FontWeights.bold);
// }

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
    fontFamily: fontFamily ?? "Inter",
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
    fontFamily: fontFamily ?? "Inter",
    height: height,
    letterSpacing: letterSpacing,
    color: Colors.white, // This will be overridden by ShaderMask
  );
}

const Color lightGrey = Color(0xEEEEEEFF);

const Color greyCol = Color(0xf593959c);

const Color inversePrimary = Color(0xff97a8c5);
