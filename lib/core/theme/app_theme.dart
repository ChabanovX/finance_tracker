import 'package:flutter/material.dart';

/// Central place for app colors.
class AppColors {
  const AppColors({
    required this.accent,
    required this.accentLight,
    required this.secondary,
    required this.inactive,
    required this.white,
  });

  final Color accent;
  final Color accentLight;
  final Color secondary;
  final Color inactive;
  final Color white;

  // Static fields for const default theme definitions.
  static const Color kAccent = Color(0xFF2AE881);
  static const Color kAccentLight = Color(0xFFD4FAE6);
  static const Color kSecondary = Color(0xFFECE6F0);
  static const Color kInactive = Color(0xFF49454F);
  static const Color kWhite = Colors.white;

  // Additional colors for dark theme.
  static const Color kAccentDarkmode = Color(0xFF1B5E20);
  static const Color kAccentLightDarkmode = Color.fromARGB(255, 22, 141, 30);
  static const Color kSecondaryDarkmode = Colors.grey;
  static const Color kInactiveDarkmode = Color(0xFF79747E);

  static const light = AppColors(
    accent: AppColors.kAccent,
    accentLight: AppColors.kAccentLight,
    secondary: AppColors.kSecondary,
    inactive: AppColors.kInactive,
    white: AppColors.kWhite,
  );

  static const dark = AppColors(
    accent: AppColors.kAccent,
    accentLight: AppColors.kAccentLightDarkmode,
    secondary: AppColors.kSecondaryDarkmode,
    inactive: AppColors.kInactiveDarkmode,
    white: AppColors.kWhite,
  );

  AppColors copyWith({
    Color? accent,
    Color? accentLight,
    Color? secondary,
    Color? inactive,
    Color? white,
  }) {
    return AppColors(
      accent: accent ?? this.accent,
      accentLight: accentLight ?? this.accentLight,
      secondary: secondary ?? this.secondary,
      inactive: inactive ?? this.inactive,
      white: white ?? this.white,
    );
  }

  static AppColors lerp(AppColors a, AppColors b, double t) {
    return AppColors(
      accent: Color.lerp(a.accent, b.accent, t)!,
      accentLight: Color.lerp(a.accentLight, b.accentLight, t)!,
      secondary: Color.lerp(a.secondary, b.secondary, t)!,
      inactive: Color.lerp(a.inactive, b.inactive, t)!,
      white: Color.lerp(a.white, b.white, t)!,
    );
  }
}

class AppColorsTheme extends ThemeExtension<AppColorsTheme> {
  const AppColorsTheme({required this.colors});

  final AppColors colors;

  @override
  AppColorsTheme copyWith({AppColors? colors}) {
    return AppColorsTheme(colors: colors ?? this.colors);
  }

  @override
  AppColorsTheme lerp(
    covariant ThemeExtension<AppColorsTheme>? other,
    double t,
  ) {
    if (other is! AppColorsTheme) return this;
    return AppColorsTheme(colors: AppColors.lerp(colors, other.colors, t));
  }
}

/// Small getter on [BuildContext] to get colors.
extension AppColorsX on BuildContext {
  AppColors get colors => Theme.of(this).extension<AppColorsTheme>()!.colors;
}

/// Global [ThemeData] for the app.
final ThemeData appTheme = ThemeData(
  colorSchemeSeed: AppColors.kAccent,
  useMaterial3: true,
  extensions: const [AppColorsTheme(colors: AppColors.light)],
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.kAccent,
    shape: CircleBorder(),
  ),
  appBarTheme: const AppBarTheme(backgroundColor: AppColors.kAccent),
  navigationBarTheme: const NavigationBarThemeData(
    indicatorColor: AppColors.kAccentLight,
  ),
);

/// Global dark [ThemeData] for the app.
final ThemeData appDarkTheme = ThemeData(
  brightness: Brightness.dark,
  colorSchemeSeed: AppColors.kAccentDarkmode,
  useMaterial3: true,
  extensions: const [AppColorsTheme(colors: AppColors.dark)],
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.kAccentDarkmode,
    shape: CircleBorder(),
  ),
  appBarTheme: const AppBarTheme(backgroundColor: AppColors.kAccentDarkmode),
  navigationBarTheme: const NavigationBarThemeData(
    indicatorColor: AppColors.kAccentLightDarkmode,
  ),
);

ThemeData buildAppTheme(Color accent) {
  final accentLight = _lighten(accent, .4);
  return ThemeData(
    colorSchemeSeed: accent,
    useMaterial3: true,
    extensions: [AppColorsTheme(colors: AppColors.light.copyWith(accent: accent, accentLight: accentLight))],
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: accent,
      shape: const CircleBorder(),
    ),
    appBarTheme: AppBarTheme(backgroundColor: accent),
    navigationBarTheme: NavigationBarThemeData(
      indicatorColor: accentLight,
    ),
  );
}

ThemeData buildAppDarkTheme(Color accent) {
  final accentLight = _lighten(accent, .2);
  return ThemeData(
    brightness: Brightness.dark,
    colorSchemeSeed: accent,
    useMaterial3: true,
    extensions: [AppColorsTheme(colors: AppColors.dark.copyWith(accent: accent, accentLight: accentLight))],
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: accent,
      shape: const CircleBorder(),
    ),
    appBarTheme: AppBarTheme(backgroundColor: accent),
    navigationBarTheme: NavigationBarThemeData(
      indicatorColor: accentLight,
    ),
  );
}

Color _lighten(Color color, [double amount = .2]) {
  final hsl = HSLColor.fromColor(color);
  final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
  return hslLight.toColor();
}
