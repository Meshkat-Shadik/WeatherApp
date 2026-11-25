// Zero-dependency alternative to app_logger.dart — same `log.d/i/w/e` API,
// backed by dart:developer instead of talker_flutter. Pick this for
// packages/plugins or apps that don't want the extra dependency or the
// in-app log-viewer UI; upgrade to the talker version if you add
// TalkerDioLogger or want a shareable in-app log screen later.
import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';

class _Log {
  const _Log();

  void d(String message) => _out(500, message);
  void i(String message) => _out(800, message);
  void w(String message) => _out(900, message);
  void e(String message, [Object? error, StackTrace? stackTrace]) => dev.log(
    message,
    name: 'app',
    level: 1000,
    error: error,
    stackTrace: stackTrace,
  );

  void _out(int level, String message) {
    if (kDebugMode) dev.log(message, name: 'app', level: level);
  }
}

const log = _Log();
