import 'package:material_ui/material_ui.dart';
import 'package:weather_app/design_system/design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../support/frames.dart';

@widgetbook.UseCase(name: 'Default', type: SectionHeader)
Widget sectionHeader(BuildContext context) => onPanel(
  context,
  SectionHeader(
    context.knobs.string(label: 'Title', initialValue: 'Weather Details'),
  ),
);
