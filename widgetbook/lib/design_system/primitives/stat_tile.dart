import 'package:material_ui/material_ui.dart';
import 'package:weather_app/design_system/design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../support/frames.dart';

@widgetbook.UseCase(name: 'Default', type: StatTile)
Widget statTile(BuildContext context) {
  final k = context.knobs;
  return onPanel(
    context,
    Center(
      child: SizedBox.square(
        dimension: 160,
        child: StatTile(
          icon: k.object.dropdown(
            label: 'Icon',
            options: const [
              Icons.air_outlined,
              Icons.opacity,
              Icons.speed,
              Icons.brightness_7,
            ],
            labelBuilder: (i) => switch (i) {
              Icons.air_outlined => 'air',
              Icons.opacity => 'opacity',
              Icons.speed => 'speed',
              _ => 'brightness',
            },
          ),
          label: k.string(label: 'Label', initialValue: 'Wind'),
          value: k.string(label: 'Value', initialValue: '3.6'),
          unit: k.stringOrNull(label: 'Unit', initialValue: 'm/s'),
          color: context.colors.stat(
            k.int.slider(label: 'Ramp index', initialValue: 0, min: 0, max: 5),
          ),
        ),
      ),
    ),
  );
}
