import 'package:material_ui/material_ui.dart';

/// Raw brand values — the only file allowed to hold hex literals.
abstract final class AppColors {
  static const Color night = Color(0xFF14141C);
  static const Color nightAlt = Color(0xFF262431);
  static const Color dusk = Color(0xFF200003);
  static const Color sun = Color(0xFFFDAE1C);
  static const Color mist = Color(0xFFF4F4F7);
  static const Color mistAlt = Color(0xFFE6E5EC);
  static const Color white = Color(0xFFFFFFFF);
  static const Color danger = Color(0xFFE5484D);

  /// Light → deep amber, one step per weather stat tile.
  static const List<Color> amberRamp = [
    Color(0xFFFFECB3),
    Color(0xFFFFE082),
    Color(0xFFFFD54F),
    Color(0xFFFFCA28),
    Color(0xFFFFC107),
    Color(0xFFFFB300),
  ];
}
