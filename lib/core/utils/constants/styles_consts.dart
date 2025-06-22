import 'package:flutter/material.dart';

import 'colors_consts.dart';

abstract class StylesConsts 
{
  static const TextStyle headerTxt = TextStyle
  (
    fontSize: 42,
    fontWeight: FontWeight.bold
  );
  static const TextStyle descTxt = TextStyle
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