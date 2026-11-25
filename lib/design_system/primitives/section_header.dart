import 'package:material_ui/material_ui.dart';

import '../theme/app_theme.dart';
import '../tokens/app_tokens.dart';
import '../tokens/app_typography.dart';

/// Accent dot + title, the heading above a panel's content.
class const SectionHeader(final String title, {super.key})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
    children: [
      Icon(Icons.circle, size: AppSize.dot, color: context.colors.accent),
      AppSpacing.gapSm,
      Text(
        title,
        style: context.typography.body.semiBold.copyWith(
          color: context.colors.onSurface,
        ),
      ),
    ],
  );
}
