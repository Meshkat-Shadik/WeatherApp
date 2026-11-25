import 'package:material_ui/material_ui.dart';
import 'package:weather_app/core/constants/app_assets.dart';
import 'package:weather_app/design_system/design_system.dart';

/// Frames that put a use case on the surface it lives on in the app, so
/// colours are judged in context. Not use cases themselves.
Widget onPhoto(
  BuildContext context,
  Widget child, {
  String asset = AppAssets.day,
}) => Scaffold(
  body: ImageBackdrop(
    image: AssetImage(asset),
    fadeTo: context.colors.scrim,
    child: Center(
      child: Padding(padding: AppSpacing.screen, child: child),
    ),
  ),
);

Widget onPanel(BuildContext context, Widget child) => Scaffold(
  backgroundColor: context.colors.surface,
  body: SingleChildScrollView(padding: AppSpacing.panel, child: child),
);

Widget onBackground(BuildContext context, Widget child) => Scaffold(
  backgroundColor: context.colors.background,
  body: Center(
    child: Padding(padding: AppSpacing.screen, child: child),
  ),
);
