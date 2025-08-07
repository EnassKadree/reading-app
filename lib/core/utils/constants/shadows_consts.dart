import 'package:flutter/material.dart';

class ShadowsConsts {
  static Color customColor = const Color(0xff101828);
  static List<BoxShadow>? xs = [
    BoxShadow(
      color: customColor.withOpacity(0.05),
      spreadRadius: 0,
      blurRadius: 2,
      offset: const Offset(0, 1),
    ),
  ];
  static List<BoxShadow>? sm = [
    BoxShadow(
      color: customColor.withOpacity(0.08),
      spreadRadius: 0,
      blurRadius: 3,
      offset: const Offset(0, 1),
    ),
    BoxShadow(
      color: customColor.withOpacity(0.10),
      spreadRadius: 0,
      blurRadius: 3,
      offset: const Offset(0, 1),
    ),
  ];
  static List<BoxShadow>? md = [
    BoxShadow(
      color: customColor.withOpacity(0.06),
      spreadRadius: -2,
      blurRadius: 4,
      offset: const Offset(0, 2),
    ),
  ];
  static List<BoxShadow>? lg = [
    BoxShadow(
      color: customColor.withOpacity(0.03),
      spreadRadius: -2,
      blurRadius: 6,
      offset: const Offset(0, 4),
    ),
  ];
  static List<BoxShadow>? xl = [
    BoxShadow(
      color: customColor.withOpacity(0.03),
      spreadRadius: -4,
      blurRadius: 8,
      offset: const Offset(0, 8),
    ),
  ];
  static List<BoxShadow>? xl2 = [
    BoxShadow(
      color: customColor.withOpacity(0.18),
      spreadRadius: -12,
      blurRadius: 48,
      offset: const Offset(0, 24),
    ),
  ];
  static List<BoxShadow>? xl3 = [
    BoxShadow(
      color: customColor.withOpacity(0.3),
      spreadRadius: 0,
      blurRadius: 24,
      offset: const Offset(0, 0),
    ),
  ];
}
