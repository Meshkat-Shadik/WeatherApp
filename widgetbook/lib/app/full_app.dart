import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:weather_app/features/location/application/location_provider.dart';
import 'package:weather_app/features/weather/application/weather_repository_provider.dart';
import 'package:weather_app/main.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:weather_widgetbook/support/fixtures.dart';

/// The whole app — real router, real screens, real notifiers — with only
/// the device edges faked (GPS city, weather API). Search a city or tap
/// "Tap to see more!" to walk the flow; the knobs pick what the fakes return.
/// Follows the device's light/dark setting like the real app.
@widgetbook.UseCase(name: 'Full flow', type: WeatherApp)
Widget weatherApp(BuildContext context) {
  final location = locationResult(
    context,
    context.knobs.object.segmented(
      label: 'Location',
      options: ScreenState.values,
      labelBuilder: (s) => s.name,
    ),
  );
  final weather = context.knobs.object.segmented(
    label: 'Weather API',
    options: ScreenState.values,
    labelBuilder: (s) => s.name,
  );
  return ProviderScope(
    key: ValueKey((location, weather)),
    overrides: [
      locationProvider.overrideWithValue(location),
      weatherRepositoryProvider.overrideWithValue(
        FakeWeatherRepository(weather),
      ),
    ],
    child: const WeatherApp(),
  );
}
