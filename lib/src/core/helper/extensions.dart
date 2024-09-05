import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

extension StringX on String {
  void toast(bool isSuccessful) {
    Fluttertoast.showToast(
      msg: this,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor:
          isSuccessful ? Colors.teal.shade600 : Colors.red.shade300,
      textColor: Colors.white,
      fontSize: 13.0,
      toastLength: Toast.LENGTH_LONG,
    );
  }
}
