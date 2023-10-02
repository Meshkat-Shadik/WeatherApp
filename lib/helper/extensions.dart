import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension TimeEx on int {
  String get toFormattedTime => DateFormat('hh:mm a')
      .format(DateTime.fromMillisecondsSinceEpoch(this * 1000))
      .toString();
}

extension SizeX on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}
