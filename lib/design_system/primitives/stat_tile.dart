import 'package:material_ui/material_ui.dart';

import '../theme/app_theme.dart';
import '../tokens/app_tokens.dart';
import '../tokens/app_typography.dart';

/// Icon, label and a value with an optional unit on a coloured tile.
class const StatTile({
  super.key,
  required final IconData icon,
  required final String label,
  required final String value,
  required final Color color,
  final String? unit,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final t = context.typography;
    final fg = context.colors.onStat;
    return DecoratedBox(
      decoration: BoxDecoration(color: color, borderRadius: AppRadii.brMd),
      child: DefaultTextStyle.merge(
        style: TextStyle(color: fg),
        child: Padding(
          padding: AppSpacing.allSm,
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Icon(icon, size: AppSize.iconLg, color: fg),
              Text(label, style: t.body.regular),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: value, style: t.title.bold),
                    if (unit != null)
                      TextSpan(text: ' $unit', style: t.label.regular),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
