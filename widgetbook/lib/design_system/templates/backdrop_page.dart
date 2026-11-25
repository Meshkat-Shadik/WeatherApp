import 'package:material_ui/material_ui.dart';
import 'package:weather_app/core/constants/app_assets.dart';
import 'package:weather_app/design_system/design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../support/slots.dart';

@widgetbook.UseCase(name: 'Slots', type: BackdropPage)
Widget backdropPage(BuildContext context) => BackdropPage(
  image: const AssetImage(AppAssets.day),
  onRefresh: () async {},
  children: [
    for (
      var i = 0;
      i <
          context.knobs.int.slider(
            label: 'Children',
            initialValue: 3,
            min: 1,
            max: 8,
          );
      i++
    ) ...[Slot('child ${i + 1}', height: 64), AppSpacing.gapMd],
  ],
);
