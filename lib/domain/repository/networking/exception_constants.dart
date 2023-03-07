import 'package:flutter/foundation.dart';

@immutable
class ExceptionConstants {
  const ExceptionConstants._();

  static const String TokenExpiredException = 'TokenExpiredException';

  static const String CancelException = 'CancelException';

  static const String ConnectTimeoutException = 'ConnectTimeoutException';

  static const String SendTimeoutException = 'SendTimeoutException';

  static const String ReceiveTimeoutException = 'ReceiveTimeoutException';

  static const String SocketException = 'SocketException';

  static const String FetchDataException = 'FetchDataException';

  static const String FormatException = 'FormatException';

  static const String UnrecognizedException = 'UnrecognizedException';

  static const String BadCertificateException = 'badCertificateException';

  static const String ApiException = 'ApiException';
}
