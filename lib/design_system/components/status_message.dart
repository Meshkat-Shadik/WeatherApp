import 'package:material_ui/material_ui.dart';

import '../theme/app_theme.dart';
import '../tokens/app_tokens.dart';
import '../tokens/app_typography.dart';

/// Centered one-liner for empty/error states, with an optional action.
class const StatusMessage({
  super.key,
  required final String message,
  final IconData icon = Icons.cloud_off_outlined,
  final String? actionLabel,
  final VoidCallback? onAction,
  final Color? color,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fg = color ?? context.colors.onSurface;
    return Padding(
      padding: AppSpacing.screen,
      child: Column(
        mainAxisSize: .min,
        children: [
          Icon(icon, size: AppSize.iconLg, color: fg),
          AppSpacing.gapMd,
          Text(
            message,
            textAlign: .center,
            style: context.typography.body.regular.copyWith(color: fg),
          ),
          if (actionLabel != null && onAction != null) ...[
            AppSpacing.gapLg,
            OutlinedButton(
              onPressed: onAction,
              style: OutlinedButton.styleFrom(
                foregroundColor: fg,
                side: BorderSide(color: fg),
              ),
              child: Text(actionLabel!),
            ),
          ],
        ],
      ),
    );
  }
}
