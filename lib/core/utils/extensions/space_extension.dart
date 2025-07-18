import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension BoolExtension on int {
  Widget get spaceH => SizedBox(height: h.h);
  Widget get spaceW => SizedBox(width: w.w);
  String get twoDigits => toString().padLeft(2, "0");
}
