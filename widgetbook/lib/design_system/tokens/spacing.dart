import 'package:material_ui/material_ui.dart';
import 'package:weather_app/design_system/design_system.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

/// Spacing, radius and size tokens drawn to scale.
class const LayoutTokens({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final label = context.typography.label.regular.copyWith(color: c.onSurface);
    Widget row(String name, Widget sample) => Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Row(
        children: [
          SizedBox(width: 120, child: Text(name, style: label)),
          sample,
        ],
      ),
    );
    return ListView(
      padding: AppSpacing.screen,
      children: [
        const SectionHeader('AppSpacing'),
        AppSpacing.gapMd,
        for (final (n, v) in [
          ('xs', AppSpacing.xs),
          ('sm', AppSpacing.sm),
          ('md', AppSpacing.md),
          ('lg', AppSpacing.lg),
          ('xl', AppSpacing.xl),
          ('xxl', AppSpacing.xxl),
        ])
          row(
            '$n · ${v.toInt()}',
            Container(width: v * 4, height: AppSpacing.md, color: c.accent),
          ),
        AppSpacing.gapXl,
        const SectionHeader('AppRadii'),
        AppSpacing.gapMd,
        for (final (n, v) in [
          ('sm', AppRadii.sm),
          ('md', AppRadii.md),
          ('lg', AppRadii.lg),
          ('pill', AppRadii.pill),
        ])
          row(
            '$n · ${v.toInt()}',
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: c.accent,
                borderRadius: BorderRadius.circular(v),
              ),
            ),
          ),
        AppSpacing.gapXl,
        const SectionHeader('AppSize'),
        AppSpacing.gapMd,
        for (final (n, v) in [
          ('iconMd', AppSize.iconMd),
          ('iconLg', AppSize.iconLg),
          ('iconXl', AppSize.iconXl),
          ('dot', AppSize.dot),
        ])
          row(
            '$n · ${v.toInt()}',
            Icon(Icons.wb_sunny, size: v, color: c.accent),
          ),
      ],
    );
  }
}

@widgetbook.UseCase(name: 'Spacing, radii, sizes', type: LayoutTokens)
Widget layoutTokens(BuildContext context) => Scaffold(
  backgroundColor: context.colors.background,
  body: const LayoutTokens(),
);
