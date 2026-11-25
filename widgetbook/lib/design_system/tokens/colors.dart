import 'package:material_ui/material_ui.dart';
import 'package:weather_app/design_system/design_system.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

/// Every semantic colour of the active theme (flip the Theme addon) and the
/// raw brand values behind them.
class const ColorTokens({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final p = context.colors;
    final semantic = {
      'background': p.background,
      'surface': p.surface,
      'onSurface': p.onSurface,
      'muted': p.muted,
      'accent': p.accent,
      'scrim': p.scrim,
      'onImage': p.onImage,
      'onStat': p.onStat,
      for (final (i, c) in p.stats.indexed) 'stats[$i]': c,
    };
    final raw = {
      'night': AppColors.night,
      'nightAlt': AppColors.nightAlt,
      'dusk': AppColors.dusk,
      'sun': AppColors.sun,
      'mist': AppColors.mist,
      'mistAlt': AppColors.mistAlt,
      'white': AppColors.white,
      'danger': AppColors.danger,
      for (final (i, c) in AppColors.amberRamp.indexed) 'amberRamp[$i]': c,
    };
    return ListView(
      padding: AppSpacing.screen,
      children: [
        const SectionHeader('AppPalette (context.colors)'),
        AppSpacing.gapMd,
        _Swatches(semantic),
        AppSpacing.gapXl,
        const SectionHeader('AppColors (raw)'),
        AppSpacing.gapMd,
        _Swatches(raw),
      ],
    );
  }
}

class const _Swatches(final Map<String, Color> colors) extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Wrap(
    spacing: AppSpacing.md,
    runSpacing: AppSpacing.md,
    children: [
      for (final MapEntry(:key, :value) in colors.entries)
        SizedBox(
          width: 120,
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Container(
                height: 56,
                decoration: BoxDecoration(
                  color: value,
                  borderRadius: AppRadii.brSm,
                  border: Border.all(color: context.colors.muted),
                ),
              ),
              AppSpacing.gapXs,
              Text(
                key,
                style: context.typography.label.semiBold.copyWith(
                  color: context.colors.onSurface,
                ),
              ),
              Text(
                '#${value.toARGB32().toRadixString(16).toUpperCase()}',
                style: context.typography.label.regular.copyWith(
                  color: context.colors.muted,
                ),
              ),
            ],
          ),
        ),
    ],
  );
}

@widgetbook.UseCase(name: 'Palette', type: ColorTokens)
Widget colorTokens(BuildContext context) => Scaffold(
  backgroundColor: context.colors.background,
  body: const ColorTokens(),
);
