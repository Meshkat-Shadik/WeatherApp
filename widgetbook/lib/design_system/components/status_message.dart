import 'package:material_ui/material_ui.dart';
import 'package:weather_app/design_system/design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../support/frames.dart';

@widgetbook.UseCase(name: 'On background', type: StatusMessage)
Widget statusMessage(BuildContext context) => onBackground(
  context,
  StatusMessage(
    message: context.knobs.string(
      label: 'Message',
      initialValue: 'city not found',
    ),
    actionLabel: context.knobs.stringOrNull(
      label: 'Action',
      initialValue: 'Retry',
    ),
    onAction: () {},
  ),
);

@widgetbook.UseCase(name: 'On photo', type: StatusMessage)
Widget statusMessageOnPhoto(BuildContext context) => onPhoto(
  context,
  StatusMessage(
    message: 'Allow location access to see your city',
    icon: Icons.location_off_outlined,
    color: context.colors.onImage,
    actionLabel: 'Try again',
    onAction: () {},
  ),
);
