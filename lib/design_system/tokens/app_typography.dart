import 'package:flutter/widgets.dart';

/// One size step with weight accessors: `context.typography.body.semiBold`.
/// Colour is applied at the call site; the font family comes from the theme.
class const AppTypeSet(final double size, {final double? height}) {
  TextStyle _w(FontWeight w) =>
      TextStyle(fontSize: size, fontWeight: w, height: height);

  TextStyle get light => _w(.w300);
  TextStyle get regular => _w(.w400);
  TextStyle get medium => _w(.w500);
  TextStyle get semiBold => _w(.w600);
  TextStyle get bold => _w(.w700);

  /// Tabular figures so temperatures don't jitter as digits change.
  TextStyle get numerals => _w(.w300).copyWith(
    fontFeatures: const [FontFeature.tabularFigures()],
    letterSpacing: -2,
  );
}

class AppTypography {
  const AppTypography._();

  static const instance = AppTypography._();

  AppTypeSet get hero => const AppTypeSet(96, height: 1);
  AppTypeSet get display => const AppTypeSet(48, height: 1.1);
  AppTypeSet get headline => const AppTypeSet(36, height: 1.15);
  AppTypeSet get titleLg => const AppTypeSet(32);
  AppTypeSet get title => const AppTypeSet(24);
  AppTypeSet get body => const AppTypeSet(16, height: 1.4);
  AppTypeSet get bodySm => const AppTypeSet(14, height: 1.4);
  AppTypeSet get label => const AppTypeSet(12, height: 1.3);
}

extension AppTypographyContext on BuildContext {
  AppTypography get typography => AppTypography.instance;
}
