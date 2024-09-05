import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionManager {
  PermissionManager._();

  static Future<PermissionStatus> _checkStoragePermission() async {
    PermissionStatus status;
    if (Platform.isAndroid) {
      final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
      final AndroidDeviceInfo info = await deviceInfoPlugin.androidInfo;
      if ((info.version.sdkInt) >= 33) {
        status = PermissionStatus.granted;
      } else {
        status = await Permission.storage.request();
      }
    } else {
      status = await Permission.storage.request();
    }

    return status;
  }

  static Future<T?> requestPermissions<T>(
      List<Permission> permissions, Future<T> Function() callback,
      {Future<T> Function()? deniedCallback}) async {
    for (final permission in permissions) {
      var status = await permission.status;
      if (permission == Permission.storage) {
        status = await _checkStoragePermission();
      }
      if (!status.isGranted) {
        status = await permission.request();
        if (!status.isGranted) {
          if (status.isPermanentlyDenied) {
            openAppSettings();
          } else {
            return await requestPermissions(permissions, callback,
                deniedCallback: deniedCallback);
          }
          if (deniedCallback != null) {
            return await deniedCallback();
          }
          // Return early if permission is not granted.
          return null;
        }
      }
    }
    // Only call the callback once, after all permissions have been checked.
    return await callback();
  }
}
