import 'package:material_ui/material_ui.dart';
import 'package:weather_app/core/constants/app_assets.dart';
import 'package:weather_app/design_system/design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../support/frames.dart';

@widgetbook.UseCase(name: 'Loaded vs placeholder', type: PlaceholderImage)
Widget placeholderImage(BuildContext context) => onPhoto(
  context,
  PlaceholderImage(
    size: context.knobs.double.slider(
      label: 'Size',
      initialValue: AppSize.iconXl,
      min: 24,
      max: 200,
    ),
    placeholder: const AssetImage(AppAssets.clearDay),
    image: context.knobs.boolean(label: 'Image resolves', initialValue: true)
        ? const NetworkImage('https://openweathermap.org/img/wn/10d@2x.png')
        // Unroutable address → never resolves → the placeholder stays.
        : const NetworkImage('https://10.255.255.1/never.png'),
  ),
  asset: AppAssets.night,
);
