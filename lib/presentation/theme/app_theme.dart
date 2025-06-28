import 'package:flutter/material.dart';

/// Central place for app colors.
class AppColors {
  const AppColors({
    required this.accent,
    required this.accentLight,
    required this.inactive,
    required this.white,
  });

  final Color accent;
  final Color accentLight;
  final Color inactive;
  final Color white;

  // Static fields for const default theme definitions.
  static const Color kAccent = Color(0xFF2AE881);
  static const Color kAccentLight = Color(0xFFD4FAE6);
  static const Color kInactive = Color(0xFF49454F);
  static const Color kWhite = Colors.white;

  // Additional colors for dark theme.
  static const Color kAccentDarkmode = Color(0xFF1B5E20);
  static const Color kAccentLightDarkmode = Color.fromARGB(255, 22, 141, 30);
  static const Color kInactiveDarkmode = Color(0xFF79747E);

  static const light = AppColors(
    accent: AppColors.kAccent,
    accentLight: AppColors.kAccentLight,
    inactive: AppColors.kInactive,
    white: AppColors.kWhite,
  );

  static const dark = AppColors(
    accent: AppColors.kAccent,
    accentLight: AppColors.kAccentLightDarkmode,
    inactive: AppColors.kInactiveDarkmode,
    white: AppColors.kWhite,
  );

  AppColors copyWith({
    Color? accent,
    Color? accentLight,
    Color? inactive,
    Color? white,
  }) {
    return AppColors(
      accent: accent ?? this.accent,
      accentLight: accentLight ?? this.accentLight,
      inactive: inactive ?? this.inactive,
      white: white ?? this.white,
    );
  }

  static AppColors lerp(AppColors a, AppColors b, double t) {
    return AppColors(
      accent: Color.lerp(a.accent, b.accent, t)!,
      accentLight: Color.lerp(a.accentLight, b.accentLight, t)!,
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
final ThemeData appDarkTheme = ThemeData.dark().copyWith(
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
