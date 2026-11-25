import 'package:material_ui/material_ui.dart';
import 'package:weather_app/design_system/design_system.dart';

/// "You are in <city>" with a button to open that city's weather.
class const CurrentLocationResult({
  super.key,
  required final String city,
  required final VoidCallback onOpen,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final onImage = context.colors.onImage;
    return Column(
      mainAxisSize: .min,
      children: [
        Text(
          'You are in',
          style: context.typography.body.regular.copyWith(color: onImage),
        ),
        AppSpacing.gapSm,
        Text(
          city,
          textAlign: .center,
          style: context.typography.title.regular.copyWith(color: onImage),
        ),
        AppSpacing.gapLg,
        FilledButton(onPressed: onOpen, child: const Text('Tap to see more!')),
      ],
    );
  }
}
