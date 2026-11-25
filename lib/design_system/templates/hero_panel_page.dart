import 'package:material_ui/material_ui.dart';

import '../extensions/context_x.dart';
import '../primitives/image_backdrop.dart';
import '../theme/app_theme.dart';
import '../tokens/app_tokens.dart';

/// Collapsing photo header with a [hero] over it, and a rounded panel holding
/// [body] that scrolls up over the photo. Without a hero (loading, error) the
/// [body] sits centred on the same photo.
class const HeroPanelPage({
  super.key,
  required final Widget body,
  final Widget? hero,
  final ImageProvider? backdrop,
  final RefreshCallback? onRefresh,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final scroll = _stacked(context, hero);
    final refreshable = switch (onRefresh) {
      final RefreshCallback refresh => RefreshIndicator(
        onRefresh: refresh,
        child: scroll,
      ),
      null => scroll,
    };
    return Scaffold(
      backgroundColor: c.scrim,
      // The photo belongs to the page, not the hero: loading and error states
      // sit on it too instead of on a bare colour.
      body: switch ((hero, backdrop)) {
        (null, final ImageProvider image) => ImageBackdrop(
          image: image,
          fadeTo: c.scrim,
          child: refreshable,
        ),
        _ => refreshable,
      },
    );
  }

  Widget _heroOnPhoto(BuildContext context, Widget h) => switch (backdrop) {
    final ImageProvider image => ImageBackdrop(
      image: image,
      fadeTo: context.colors.scrim,
      child: SafeArea(child: Center(child: h)),
    ),
    null => SafeArea(child: Center(child: h)),
  };

  Widget _stacked(BuildContext context, Widget? h) {
    final c = context.colors;
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverAppBar(
          backgroundColor: h == null && backdrop != null
              ? Colors.transparent
              : c.scrim,
          expandedHeight: h == null ? null : context.height * .55,
          flexibleSpace: h == null
              ? null
              : FlexibleSpaceBar(background: _heroOnPhoto(context, h)),
        ),
        if (h == null)
          SliverFillRemaining(hasScrollBody: false, child: Center(child: body))
        else
          // Flutter 3.50 SliverClipRRect: round the panel's top edge without
          // leaving the sliver protocol. The body is a box sliver — never
          // measured for intrinsics, so LayoutBuilder content is fine.
          SliverClipRRect(
            borderRadius: AppRadii.topLg,
            sliver: DecoratedSliver(
              decoration: BoxDecoration(color: c.surface),
              sliver: SliverPadding(
                padding: AppSpacing.panel,
                sliver: SliverToBoxAdapter(child: body),
              ),
            ),
          ),
        if (h != null)
          // Paints the panel colour down to the bottom when content is short.
          SliverFillRemaining(
            hasScrollBody: false,
            child: ColoredBox(color: c.surface),
          ),
      ],
    );
  }
}
