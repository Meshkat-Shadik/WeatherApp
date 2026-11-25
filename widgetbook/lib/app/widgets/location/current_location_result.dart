import 'package:material_ui/material_ui.dart';
import 'package:weather_app/design_system/design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:weather_widgetbook/support/frames.dart';

import 'package:weather_app/features/location/presentation/widgets/current_location_result.dart';

@widgetbook.UseCase(name: 'Default', type: CurrentLocationResult)
Widget currentLocationResult(BuildContext context) => onPhoto(
  context,
  Builder(
    builder: (context) => CurrentLocationResult(
      city: context.knobs.string(
        label: 'City',
        initialValue: 'Dhaka, Bangladesh',
      ),
      onOpen: () => AppFeedback.toast(context, 'Open weather'),
    ),
  ),
);
