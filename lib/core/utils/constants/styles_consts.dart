import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors_consts.dart';
abstract class StylesConsts
{
  static  TextStyle f18W600Black = TextStyle(
      fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.black);

  static TextStyle f18W400grey=TextStyle(
    color: Colors.grey,
    fontSize: 18.sp,
  );
  static  TextStyle f24BoldBlack =TextStyle(
  fontSize: 20.sp,
  fontWeight: FontWeight.w500,
  );
  static  TextStyle f30W500White =
  TextStyle(fontSize: 26.sp, color: Colors.white, fontWeight: FontWeight.w600);

  static  TextStyle f16W600Black =
  TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: Colors.black);

  static  TextStyle headerTxt = TextStyle
    (
      fontSize: 42.sp,
      fontWeight: FontWeight.bold
  );
  static  TextStyle descTxt = TextStyle
    (
      color: ColorsConsts.grey,
      fontSize: 14.sp
  );
static TextStyle f18W600White=TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600,color:Colors.white );
  static TextStyle f15W400Grey= TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w400,color:Colors.grey.shade500 );
static TextStyle f23W600Yellow=TextStyle(
    fontSize: 23.sp,fontWeight: FontWeight.w600,color:ColorsConsts.gold );
  static  TextStyle introText = TextStyle
    (
    color: ColorsConsts.white,
    fontSize: 20.sp,
  );

}