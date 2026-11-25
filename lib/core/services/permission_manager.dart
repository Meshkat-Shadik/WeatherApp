import 'package:permission_handler/permission_handler.dart';

enum PermissionResult { granted, denied, blocked }

abstract final class PermissionManager {
  /// Asks once. `blocked` means the OS will no longer show the prompt — the
  /// UI should offer [openSettings] rather than jump there unprompted.
  static Future<PermissionResult> request(Permission permission) async {
    final status = await permission.request();
    return switch (status) {
      .granted || .limited => .granted,
      .permanentlyDenied || .restricted => .blocked,
      _ => .denied,
    };
  }

  static Future<void> openSettings() => openAppSettings();
}
