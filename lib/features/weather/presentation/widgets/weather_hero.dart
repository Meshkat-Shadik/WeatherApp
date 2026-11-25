import 'package:material_ui/material_ui.dart';
import 'package:weather_app/design_system/design_system.dart';

/// Composite: icon, city, condition, big temperature — over a photo.
class const WeatherHero({
  super.key,
  required final String cityName,
  required final String condition,
  required final String description,
  required final String temperature,
  required final String feelsLike,
  required final ImageProvider icon,
  final String? observedAt,
  final ImageProvider? iconPlaceholder,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final t = context.typography;
    return DefaultTextStyle.merge(
      style: TextStyle(color: context.colors.onImage),
      textAlign: .center,
      child: Column(
        mainAxisSize: .min,
        children: [
          PlaceholderImage(
            image: icon,
            placeholder: iconPlaceholder,
            size: AppSize.iconXl,
          ),
          Text(cityName, style: t.headline.regular),
          Text([condition, ?observedAt].join(' · '), style: t.body.medium),
          Text(description, style: t.bodySm.regular),
          Text('$temperature°', style: t.hero.numerals),
          Text('Feels like $feelsLike°', style: t.body.regular),
        ],
      ),
    );
  }
}
