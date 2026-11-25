import 'package:material_ui/material_ui.dart';

import '../tokens/app_colors.dart';

/// Semantic colours. Screens read `context.colors.*` and get the right mode.
class const AppPalette({
  required final Color background,
  required final Color surface,
  required final Color onSurface,
  required final Color muted,
  required final Color accent,
  required final Color scrim,
  required final Color onImage,
  required final Color onStat,
  required final List<Color> stats,
}) extends ThemeExtension<AppPalette> {
  static const dark = AppPalette(
    background: AppColors.night,
    surface: AppColors.night,
    onSurface: AppColors.white,
    muted: Color(0x8AFFFFFF),
    accent: AppColors.sun,
    scrim: AppColors.dusk,
    onImage: AppColors.white,
    onStat: AppColors.night,
    stats: AppColors.amberRamp,
  );

  static const light = AppPalette(
    background: AppColors.mist,
    surface: AppColors.mistAlt,
    onSurface: AppColors.night,
    muted: Color(0x8A14141C),
    accent: AppColors.sun,
    scrim: AppColors.nightAlt,
    onImage: AppColors.white,
    onStat: AppColors.night,
    stats: AppColors.amberRamp,
  );

  /// Stat tile colour by position; wraps so any count of tiles works.
  Color stat(int index) => stats[index % stats.length];

  @override
  AppPalette copyWith({
    Color? background,
    Color? surface,
    Color? onSurface,
    Color? muted,
    Color? accent,
    Color? scrim,
    Color? onImage,
    Color? onStat,
    List<Color>? stats,
  }) => AppPalette(
    background: background ?? this.background,
    surface: surface ?? this.surface,
    onSurface: onSurface ?? this.onSurface,
    muted: muted ?? this.muted,
    accent: accent ?? this.accent,
    scrim: scrim ?? this.scrim,
    onImage: onImage ?? this.onImage,
    onStat: onStat ?? this.onStat,
    stats: stats ?? this.stats,
  );

  @override
  AppPalette lerp(AppPalette? other, double t) {
    if (other == null) return this;
    Color c(Color a, Color b) => Color.lerp(a, b, t)!;
    return AppPalette(
      background: c(background, other.background),
      surface: c(surface, other.surface),
      onSurface: c(onSurface, other.onSurface),
      muted: c(muted, other.muted),
      accent: c(accent, other.accent),
      scrim: c(scrim, other.scrim),
      onImage: c(onImage, other.onImage),
      onStat: c(onStat, other.onStat),
      stats: [for (var i = 0; i < stats.length; i++) c(stat(i), other.stat(i))],
    );
  }
}
