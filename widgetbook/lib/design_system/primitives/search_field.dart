import 'package:material_ui/material_ui.dart';
import 'package:weather_app/design_system/design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../support/frames.dart';

@widgetbook.UseCase(name: 'Default', type: SearchField)
Widget searchField(BuildContext context) => onPhoto(
  context,
  Builder(
    builder: (context) => SearchField(
      hint: context.knobs.stringOrNull(
        label: 'Hint',
        initialValue: 'Enter the city name',
      ),
      onSubmitted: (text) => AppFeedback.toast(context, 'Submitted: $text'),
    ),
  ),
);
