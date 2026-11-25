import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:weather_widgetbook/support/fixtures.dart';

import 'package:weather_app/features/location/application/location_provider.dart';
import 'package:weather_app/features/location/presentation/screens/initial_location_screen.dart';

/// GPS and permission prompts can't run here, so the notifier is pinned.
@widgetbook.UseCase(name: 'States', type: InitialLocationScreen)
Widget locationScreen(BuildContext context) {
  final value = locationResult(context, screenStateKnob(context));
  return ProviderScope(
    key: ValueKey(value),
    overrides: [locationProvider.overrideWithValue(value)],
    child: const InitialLocationScreen(),
  );
}
