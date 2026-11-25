import 'package:material_ui/material_ui.dart';

import '../tokens/app_tokens.dart';

/// Every toast and dialog goes through here — screens never call
/// ScaffoldMessenger/showDialog inline. Takes strings, not app error types,
/// so the design system stays portable.
abstract final class AppFeedback {
  static void toast(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(message), duration: AppDurations.toast),
      );
  }

  /// Error dialog with Close/Retry. Resolves true when the user retries.
  static Future<bool> retry(
    BuildContext context, {
    required String title,
    required String message,
  }) async {
    final ok = await showDialog<bool>(
      context: context,
      // Nearest navigator, not the root: a host (widgetbook, a mounted flow)
      // may own an outer navigator built on a different design library.
      useRootNavigator: false,
      builder: (context) => AlertDialog.adaptive(
        title: Text(title, textAlign: .center),
        content: Text(message, textAlign: .center),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Close'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
    return ok ?? false;
  }
}
