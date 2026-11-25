import 'package:flutter/widgets.dart';

// sizeOf rebuilds only on size changes; MediaQuery.of(context).size would
// rebuild on every MediaQuery change (insets, text scale, brightness…).
extension ContextX on BuildContext {
  double get width => MediaQuery.sizeOf(this).width;
  double get height => MediaQuery.sizeOf(this).height;
}
