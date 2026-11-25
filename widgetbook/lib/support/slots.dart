import 'package:material_ui/material_ui.dart';
import 'package:weather_app/design_system/design_system.dart';

/// Labelled placeholder box for template use cases: shows where content goes
/// without any real content.
class const Slot(
  final String label, {
  super.key,
  final double? height,
  final double? width,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
    height: height,
    width: width,
    alignment: .center,
    decoration: BoxDecoration(
      color: context.colors.accent.withValues(alpha: .15),
      border: Border.all(color: context.colors.accent),
      borderRadius: AppRadii.brSm,
    ),
    child: Text(
      label,
      style: context.typography.label.semiBold.copyWith(
        color: context.colors.accent,
      ),
    ),
  );
}
