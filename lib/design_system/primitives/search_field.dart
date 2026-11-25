import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:material_ui/material_ui.dart';

import '../theme/app_theme.dart';

/// Pill search box for use over imagery; reports trimmed, non-empty input on
/// keyboard submit or the trailing icon.
class const SearchField({
  super.key,
  required final ValueChanged<String> onSubmitted,
  final String? hint,
  final IconData icon = Icons.search,
}) extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final fg = context.colors.onImage;
    void submit() {
      final text = controller.text.trim();
      if (text.isNotEmpty) onSubmitted(text);
    }

    return TextField(
      controller: controller,
      textInputAction: .search,
      onSubmitted: (_) => submit(),
      style: TextStyle(color: fg),
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: IconButton(
          onPressed: submit,
          icon: Icon(icon, color: fg),
        ),
      ),
    );
  }
}
