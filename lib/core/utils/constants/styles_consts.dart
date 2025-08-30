import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/utils/constants/fonts_consts.dart';

import 'colors_consts.dart';

abstract class StylesConsts {
  static TextStyle f18W600Black =
      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600);

  static TextStyle f18W400grey = TextStyle(
    color: Colors.grey,
    fontSize: 18.sp,
  );
  static TextStyle f24BoldBlack = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
  );
  static TextStyle f30W500White = TextStyle(
      fontSize: 26.sp, color: Colors.white, fontWeight: FontWeight.w600);

  static TextStyle f16W600Black =
      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600);
  static TextStyle f14W600Black =
      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600);

  static TextStyle headerTxt = TextStyle(
      fontSize: 48.sp,
      fontWeight: FontWeight.bold,
      fontFamily: FontsConsts.sansita,
      height: .9);
  static TextStyle descTxt =
      TextStyle(color: ColorsConsts.grey, fontSize: 14.sp);
  static TextStyle f18W600White = TextStyle(
      fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.white);
  static TextStyle f15W400Grey = TextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeight.w400,
      color: Colors.grey.shade500);
  static TextStyle f23W600Yellow = TextStyle(
      fontSize: 23.sp, fontWeight: FontWeight.w600, color: ColorsConsts.gold);
  static TextStyle f20W600Yellow = TextStyle(
      fontSize: 20.sp, fontWeight: FontWeight.w600, color: ColorsConsts.gold);

  static TextStyle f15W600Grey = TextStyle(
      fontSize: 15.sp, fontWeight: FontWeight.w600, color: ColorsConsts.grey);
  static TextStyle introText = TextStyle(
    color: ColorsConsts.white,
    fontSize: 20.sp,
  );
  static TextStyle f14W400Black =  TextStyle(
  fontSize: 14.0.sp,
  fontWeight: FontWeight.w400,

  );
  static TextStyle  f20BoldWhite=
      TextStyle(
          fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white);
}
