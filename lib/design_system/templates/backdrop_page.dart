import 'package:material_ui/material_ui.dart';

import '../extensions/context_x.dart';
import '../primitives/image_backdrop.dart';
import '../theme/app_theme.dart';
import '../tokens/app_tokens.dart';

/// Full-bleed photo page: a pull-to-refresh column over [image], starting a
/// tenth of the screen down. Slots only — the screen decides the content.

class const BackdropPage({
  super.key,
  required final ImageProvider image,
  required final List<Widget> children,
  final RefreshCallback? onRefresh,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final list = ListView(
      padding: AppSpacing.screen,
      physics: const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      children: [
        SizedBox(height: context.height * .1),
        ...children,
      ],
    );
    return Scaffold(
      backgroundColor: context.colors.scrim,
      resizeToAvoidBottomInset: false,
      body: ImageBackdrop(
        image: image,
        fadeTo: context.colors.scrim,
        child: SafeArea(
          child: switch (onRefresh) {
            final RefreshCallback refresh => RefreshIndicator(
              onRefresh: refresh,
              child: list,
            ),
            null => list,
          },
        ),
      ),
    );
  }
}
