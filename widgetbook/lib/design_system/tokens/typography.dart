import 'package:material_ui/material_ui.dart';
import 'package:weather_app/design_system/design_system.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

/// Every step of the type scale in every weight.
class const TypeScale({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final t = context.typography;
    final steps = {
      'hero 96': t.hero,
      'display 48': t.display,
      'headline 36': t.headline,
      'titleLg 32': t.titleLg,
      'title 24': t.title,
      'body 16': t.body,
      'bodySm 14': t.bodySm,
      'label 12': t.label,
    };
    final color = context.colors.onSurface;
    return ListView(
      padding: AppSpacing.screen,
      children: [
        for (final MapEntry(:key, value: s) in steps.entries) ...[
          Text(
            key,
            style: t.label.regular.copyWith(color: context.colors.muted),
          ),
          Wrap(
            spacing: AppSpacing.lg,
            children: [
              for (final style in [
                s.light,
                s.regular,
                s.medium,
                s.semiBold,
                s.bold,
              ])
                Text('Aa', style: style.copyWith(color: color)),
              Text('29.4°', style: s.numerals.copyWith(color: color)),
            ],
          ),
          AppSpacing.gapLg,
        ],
      ],
    );
  }
}

@widgetbook.UseCase(name: 'Scale', type: TypeScale)
Widget typeScale(BuildContext context) => Scaffold(
  backgroundColor: context.colors.background,
  body: const TypeScale(),
);
