import 'package:material_ui/material_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:weather_widgetbook/support/frames.dart';

import 'package:weather_app/features/weather/presentation/widgets/weather_details_panel.dart';

@widgetbook.UseCase(name: 'All values', type: WeatherDetailsPanel)
Widget weatherDetailsPanel(BuildContext context) => onPanel(
  context,
  WeatherDetailsPanel(
    wind: context.knobs.string(label: 'Wind', initialValue: '3.6'),
    humidity: context.knobs.string(label: 'Humidity', initialValue: '74'),
    pressure: context.knobs.string(label: 'Pressure', initialValue: '1008'),
    gust: context.knobs.stringOrNull(label: 'Gust', initialValue: '5.2'),
    sunrise: context.knobs.stringOrNull(
      label: 'Sunrise',
      initialValue: '06:12 AM',
    ),
    sunset: context.knobs.stringOrNull(
      label: 'Sunset',
      initialValue: '05:14 PM',
    ),
  ),
);

@widgetbook.UseCase(name: 'Optional values missing', type: WeatherDetailsPanel)
Widget weatherDetailsPanelMissing(BuildContext context) => onPanel(
  context,
  const WeatherDetailsPanel(wind: '3.6', humidity: '74', pressure: '1008'),
);
