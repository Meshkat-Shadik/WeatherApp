import 'package:material_ui/material_ui.dart';
import 'package:weather_app/design_system/design_system.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../support/frames.dart';

@widgetbook.UseCase(name: 'Toast and retry dialog', type: AppFeedback)
Widget appFeedback(BuildContext context) => onBackground(
  context,
  Builder(
    builder: (context) => Column(
      mainAxisSize: .min,
      children: [
        FilledButton(
          onPressed: () => AppFeedback.toast(context, 'Saved'),
          child: const Text('toast'),
        ),
        AppSpacing.gapLg,
        FilledButton(
          onPressed: () async {
            final retry = await AppFeedback.retry(
              context,
              title: 'Not Found',
              message: 'city not found',
            );
            if (context.mounted) {
              AppFeedback.toast(context, retry ? 'Retry tapped' : 'Closed');
            }
          },
          child: const Text('retry dialog'),
        ),
      ],
    ),
  ),
);
