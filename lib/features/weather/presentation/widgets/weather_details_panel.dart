import 'package:material_ui/material_ui.dart';
import 'package:weather_app/design_system/design_system.dart';

/// Composite: "Weather Details" header over the six weather stats.
class const WeatherDetailsPanel({
  super.key,
  required final String wind,
  required final String humidity,
  required final String pressure,
  final String? gust,
  final String? sunrise,
  final String? sunset,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: .start,
    children: [
      const SectionHeader('Weather Details'),
      AppSpacing.gapLg,
      StatGrid(
        items: [
          StatItem(
            icon: Icons.air_outlined,
            label: 'Wind',
            value: wind,
            unit: 'm/s',
          ),
          StatItem(
            icon: Icons.opacity,
            label: 'Humidity',
            value: humidity,
            unit: '%',
          ),
          StatItem(
            icon: Icons.fast_forward,
            label: 'Gust',
            value: gust ?? '–',
            unit: gust == null ? null : 'm/s',
          ),
          StatItem(
            icon: Icons.speed,
            label: 'Pressure',
            value: pressure,
            unit: 'hPa',
          ),
          StatItem(
            icon: Icons.brightness_7,
            label: 'Sunrise',
            value: sunrise ?? '–',
          ),
          StatItem(
            icon: Icons.brightness_3,
            label: 'Sunset',
            value: sunset ?? '–',
          ),
        ],
      ),
    ],
  );
}
