import 'package:material_ui/material_ui.dart';
import 'package:weather_app/core/constants/app_assets.dart';
import 'package:weather_app/design_system/design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: ImageBackdrop)
Widget imageBackdrop(BuildContext context) => ImageBackdrop(
  image: AssetImage(
    context.knobs.object.segmented(
      label: 'Image',
      options: const [AppAssets.day, AppAssets.night],
      labelBuilder: (a) => a == AppAssets.day ? 'day' : 'night',
    ),
  ),
  fadeTo: context.knobs.boolean(label: 'Fade to scrim', initialValue: true)
      ? context.colors.scrim
      : Colors.transparent,
);
