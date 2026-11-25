import 'package:material_ui/material_ui.dart';
import 'package:weather_app/design_system/design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

/// Every `AppDurations` step moving the same distance — flip the "Play" knob
/// to compare how each feels.
class const MotionTokens({super.key, required final bool end})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final label = context.typography.label.regular.copyWith(color: c.onSurface);
    return ListView(
      padding: AppSpacing.screen,
      children: [
        const SectionHeader('AppDurations'),
        AppSpacing.gapMd,
        for (final (n, d) in [
          ('fast', AppDurations.fast),
          ('normal', AppDurations.normal),
          ('slow', AppDurations.slow),
          ('toast', AppDurations.toast),
        ])
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.md),
            child: Row(
              children: [
                SizedBox(
                  width: 120,
                  child: Text('$n · ${d.inMilliseconds}ms', style: label),
                ),
                Expanded(
                  child: AnimatedAlign(
                    duration: d,
                    curve: Curves.easeInOut,
                    alignment: end ? .centerRight : .centerLeft,
                    child: Icon(
                      Icons.circle,
                      size: AppSize.iconMd,
                      color: c.accent,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

@widgetbook.UseCase(name: 'Durations', type: MotionTokens)
Widget motionTokens(BuildContext context) => Scaffold(
  backgroundColor: context.colors.background,
  body: MotionTokens(
    end: context.knobs.boolean(label: 'Play', initialValue: false),
  ),
);
