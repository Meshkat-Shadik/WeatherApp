import 'package:intl/intl.dart';

extension TimeEx on int {
  String get toFormattedTime => DateFormat('hh:mm a')
      .format(DateTime.fromMillisecondsSinceEpoch(this * 1000))
      .toString();
}
