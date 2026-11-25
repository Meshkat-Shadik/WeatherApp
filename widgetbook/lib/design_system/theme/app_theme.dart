import 'package:material_ui/material_ui.dart';
import 'package:weather_app/design_system/design_system.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

/// Material components as the theme styles them — inputs, buttons,
/// progress, snackbar — on the same backdrop the app uses.
class const ThemePreview({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: context.colors.scrim,
    body: Builder(
      builder: (context) => ListView(
        padding: AppSpacing.screen,
        children: [
          const TextField(
            decoration: InputDecoration(
              hintText: 'Input (inputDecorationTheme)',
            ),
          ),
          AppSpacing.gapLg,
          FilledButton(onPressed: () {}, child: const Text('FilledButton')),
          AppSpacing.gapLg,
          TextButton(
            onPressed: () =>
                AppFeedback.toast(context, 'snackBarTheme · floating'),
            child: const Text('Show snackbar'),
          ),
          AppSpacing.gapLg,
          const Center(child: CircularProgressIndicator()),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Components', type: ThemePreview)
Widget themePreview(BuildContext context) => const ThemePreview();
