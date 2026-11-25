import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:weather_widgetbook/support/fixtures.dart';

import 'package:weather_app/features/weather/application/weather_repository_provider.dart';
import 'package:weather_app/features/weather/presentation/screens/weather_information_screen.dart';

/// Real notifier, fake repository: the production loading → data | error flow.
@widgetbook.UseCase(name: 'States', type: WeatherInformationScreen)
Widget weatherScreen(BuildContext context) {
  final state = screenStateKnob(context);
  return ProviderScope(
    key: ValueKey(state),
    overrides: [
      weatherRepositoryProvider.overrideWithValue(FakeWeatherRepository(state)),
    ],
    child: WeatherInformationScreen(
      city: context.knobs.string(label: 'City', initialValue: 'Dhaka'),
    ),
  );
}
