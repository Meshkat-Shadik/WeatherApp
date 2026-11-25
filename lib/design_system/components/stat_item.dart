import 'package:material_ui/material_ui.dart';

/// One entry of a [StatGrid]; a value class so the grid's API is one list.
class const StatItem({
  required final IconData icon,
  required final String label,
  required final String value,
  final String? unit,
});
