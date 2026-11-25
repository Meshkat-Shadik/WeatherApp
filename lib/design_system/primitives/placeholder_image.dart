import 'package:material_ui/material_ui.dart';

/// Square image that paints [placeholder] until [image] resolves — Flutter
/// 3.50's `DecorationImage.placeholder`, no FadeInImage/placeholder URL.
class const PlaceholderImage({
  super.key,
  required final ImageProvider image,
  required final double size,
  final ImageProvider? placeholder,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SizedBox.square(
    dimension: size,
    child: DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(image: image, placeholder: placeholder),
      ),
    ),
  );
}
