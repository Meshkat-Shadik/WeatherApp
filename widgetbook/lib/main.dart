// Widgetbook's own addons (Inspector) are built on the SDK material library
// and look up ITS localizations, a different type from material_ui's.
// ignore: deprecated_member_use
import 'package:flutter/material.dart' as sdk show DefaultMaterialLocalizations;
import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';
import 'package:weather_app/design_system/design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'main.directories.g.dart';

void main() => runApp(const WidgetbookApp());

@widgetbook.App()
class const WidgetbookApp({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Widgetbook(
    directories: directories,
    // widgetbook 3.25 builds on the SDK `flutter/material`, whose types differ
    // from `material_ui`'s. Each use case therefore gets its own material_ui
    // MaterialApp (theme, localizations, overlay for dialogs) and the theme
    // addon injects a material_ui Theme.
    appBuilder: (context, child) => DefaultAssetBundle(
      bundle: _AppPackageAssetBundle(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // material_ui's localizations are added by MaterialApp itself; the
        // SDK ones serve widgetbook addons (Inspector's ExpansionTile).
        localizationsDelegates: const [
          sdk.DefaultMaterialLocalizations.delegate,
        ],
        home: child,
      ),
    ),
    addons: [
      ThemeAddon<ThemeData>(
        themes: [
          WidgetbookTheme(name: 'Dark', data: AppTheme.dark()),
          WidgetbookTheme(name: 'Light', data: AppTheme.light()),
        ],
        themeBuilder: (context, theme, child) =>
            Theme(data: theme, child: child),
      ),
      ViewportAddon([
        Viewports.none,
        ...IosViewports.phones,
        ...AndroidViewports.phones,
        ...IosViewports.tablets,
        ...AndroidViewports.tablets,
        ...MacosViewports.all,
      ]),
      TextScaleAddon(min: 1, max: 2),
      InspectorAddon(),
    ],
  );
}

/// The app's widgets reference `assets/…`; from this package those files live
/// under `packages/weather_app/assets/…`.
class _AppPackageAssetBundle extends CachingAssetBundle {
  @override
  Future<ByteData> load(String key) => rootBundle.load(
    key.startsWith('assets/') ? 'packages/weather_app/$key' : key,
  );
}
