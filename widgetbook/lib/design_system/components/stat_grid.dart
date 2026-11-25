import 'package:material_ui/material_ui.dart';
import 'package:weather_app/design_system/design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../support/frames.dart';

@widgetbook.UseCase(name: 'Ramp', type: StatGrid)
Widget statGrid(BuildContext context) {
  final count = context.knobs.int.slider(
    label: 'Items',
    initialValue: 6,
    min: 1,
    max: 12,
  );
  return onPanel(
    context,
    StatGrid(
      columns: context.knobs.int.slider(
        label: 'Columns',
        initialValue: 2,
        min: 1,
        max: 4,
      ),
      items: [
        for (var i = 0; i < count; i++)
          StatItem(
            icon: Icons.insights,
            label: 'Stat ${i + 1}',
            value: '${(i + 1) * 7}',
            unit: 'u',
          ),
      ],
    ),
  );
}
