import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  /// 07:42 AM
  String get clock => DateFormat('hh:mm a').format(this);
}
