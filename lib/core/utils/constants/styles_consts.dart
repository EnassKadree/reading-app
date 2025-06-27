import 'package:flutter/material.dart';

import 'colors_consts.dart';
abstract class StylesConsts
{
  static const TextStyle f18W600Black =
  TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black);
  static const TextStyle f30W500White =
  TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.w600);

  static const TextStyle f16W600Black =
  TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black);

  static const TextStyle headerTxt = TextStyle
    (
      fontSize: 42,
      fontWeight: FontWeight.bold
  );
  static final TextStyle descTxt = TextStyle
    (
      color: ColorsConsts.grey,
      fontSize: 14
  );

  static const TextStyle introText = TextStyle
    (
    color: ColorsConsts.white,
    fontSize: 20,
  );

}