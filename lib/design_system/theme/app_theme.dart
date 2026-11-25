import 'package:google_fonts/google_fonts.dart';
import 'package:material_ui/material_ui.dart';

import '../tokens/app_colors.dart';
import '../tokens/app_tokens.dart';
import 'app_palette.dart';

/// Light and dark are built from one [_base] so the two modes never drift.
abstract final class AppTheme {
  static ThemeData light() => _base(AppPalette.light, .light);
  static ThemeData dark() => _base(AppPalette.dark, .dark);

  static ThemeData _base(AppPalette p, Brightness brightness) {
    final scheme = ColorScheme.fromSeed(
      seedColor: p.accent,
      brightness: brightness,
      surface: p.background,
      onSurface: p.onSurface,
      error: AppColors.danger,
    );
    final base = ThemeData(colorScheme: scheme, brightness: brightness);

    return base.copyWith(
      extensions: [p],
      scaffoldBackgroundColor: p.background,
      textTheme: GoogleFonts.ralewayTextTheme(base.textTheme)
          .apply(bodyColor: p.onSurface, displayColor: p.onSurface),
      appBarTheme: AppBarThemeData(
        backgroundColor: Colors.transparent,
        foregroundColor: p.onImage,
        elevation: 0,
      ),
      inputDecorationTheme: InputDecorationThemeData(
        hintStyle: TextStyle(color: p.onImage.withValues(alpha: .54)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xl,
          vertical: AppSpacing.lg,
        ),
        border: _pill(p.onImage),
        enabledBorder: _pill(p.onImage),
        focusedBorder: _pill(p.accent),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: p.onImage.withValues(alpha: .1),
          foregroundColor: p.onImage,
          padding: AppSpacing.allLg,
          shape: const RoundedRectangleBorder(borderRadius: AppRadii.brPill),
        ),
      ),
      snackBarTheme: const SnackBarThemeData(behavior: .floating),
      progressIndicatorTheme: ProgressIndicatorThemeData(color: p.accent),
    );
  }

  static OutlineInputBorder _pill(Color color) => OutlineInputBorder(
    borderSide: BorderSide(color: color),
    borderRadius: AppRadii.brPill,
  );
}

extension AppThemeX on BuildContext {
  AppPalette get colors => Theme.of(this).extension<AppPalette>()!;
  TextTheme get text => Theme.of(this).textTheme;
}
