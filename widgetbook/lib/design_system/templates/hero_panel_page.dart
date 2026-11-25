import 'package:material_ui/material_ui.dart';
import 'package:weather_app/core/constants/app_assets.dart';
import 'package:weather_app/design_system/design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../support/slots.dart';

@widgetbook.UseCase(name: 'With hero', type: HeroPanelPage)
Widget heroPanelPage(BuildContext context) => HeroPanelPage(
  backdrop: const AssetImage(AppAssets.night),
  hero: const Slot('hero', height: 220, width: 260),
  body: const Slot('body (panel)', height: 360),
  onRefresh: () async {},
);

@widgetbook.UseCase(name: 'Without hero', type: HeroPanelPage)
Widget heroPanelPageBare(BuildContext context) => HeroPanelPage(
  // Loading/error states keep the page photo behind the centred body.
  backdrop: context.knobs.boolean(label: 'Backdrop', initialValue: true)
      ? const AssetImage(AppAssets.night)
      : null,
  body: const Slot('body (loading / error)', height: 120, width: 260),
  onRefresh: () async {},
);
