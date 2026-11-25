import 'package:material_ui/material_ui.dart';
import 'package:weather_app/core/constants/app_assets.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:weather_widgetbook/support/frames.dart';

import 'package:weather_app/features/weather/presentation/widgets/weather_hero.dart';

@widgetbook.UseCase(name: 'Default', type: WeatherHero)
Widget weatherHero(BuildContext context) {
  final k = context.knobs;
  return onPhoto(
    context,
    WeatherHero(
      cityName: k.string(label: 'City', initialValue: 'Dhaka'),
      condition: k.string(label: 'Condition', initialValue: 'Clouds'),
      description: k.string(
        label: 'Description',
        initialValue: 'broken clouds',
      ),
      observedAt: k.stringOrNull(
        label: 'Observed at',
        initialValue: '02:30 PM',
      ),
      temperature: k.double.slider(
        label: 'Temperature',
        initialValue: 29.4,
        min: -30,
        max: 50,
      ).toStringAsFixed(1),
      feelsLike: k.double.slider(
        label: 'Feels like',
        initialValue: 33.1,
        min: -30,
        max: 50,
      ).toStringAsFixed(1),
      // 'broken' shows the placeholder path a failed icon download takes.
      icon: NetworkImage(
        'https://openweathermap.org/img/wn/${k.object.dropdown(label: 'Icon', options: const ['04d', '01d', '10n', '13d', 'broken'], initialOption: '04d')}@2x.png',
      ),
      iconPlaceholder: k.boolean(label: 'Icon placeholder', initialValue: true)
          ? const AssetImage(AppAssets.clearDay)
          : null,
    ),
    asset: k.object.segmented(
      label: 'Backdrop',
      options: const [AppAssets.night, AppAssets.day],
      labelBuilder: (a) => a == AppAssets.day ? 'day' : 'night',
    ),
  );
}
