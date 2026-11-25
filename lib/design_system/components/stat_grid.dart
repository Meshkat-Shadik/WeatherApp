import 'package:material_ui/material_ui.dart';

import '../theme/app_theme.dart';
import '../tokens/app_tokens.dart';
import '../primitives/stat_tile.dart';
import 'stat_item.dart';

/// Grid of [StatTile]s, coloured along the palette's stat ramp.
class const StatGrid({
  super.key,
  required final List<StatItem> items,
  final int columns = 2,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GridView.count(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    padding: .zero,
    crossAxisCount: columns,
    crossAxisSpacing: AppSpacing.md,
    mainAxisSpacing: AppSpacing.md,
    children: [
      for (final (i, item) in items.indexed)
        StatTile(
          icon: item.icon,
          label: item.label,
          value: item.value,
          unit: item.unit,
          color: context.colors.stat(i),
        ),
    ],
  );
}
