import 'package:material_ui/material_ui.dart';

/// Photo filling the box, fading into [fadeTo] so content on top stays legible.
class const ImageBackdrop({
  super.key,
  required final ImageProvider image,
  required final Color fadeTo,
  final Widget? child,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      color: fadeTo,
      image: DecorationImage(image: image, fit: .cover, alignment: .topCenter),
    ),
    child: DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: .topCenter,
          end: .bottomCenter,
          colors: [fadeTo.withValues(alpha: .1), fadeTo],
          stops: const [.25, .9],
        ),
      ),
      child: child ?? const SizedBox.expand(),
    ),
  );
}
