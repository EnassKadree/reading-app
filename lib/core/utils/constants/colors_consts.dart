import 'package:flutter/material.dart';

abstract class ColorsConsts 
{
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color gold = Color(0xFFf0d2ae);
  static const Color purple = Color(0xFF584185);
  static const Color pink = Color(0xFFf7b3bc);
  static const Color grey =Colors.grey;

  static const List<Color> gradientColors = [
    Color(0xFF584185), // 3: base purple
    Color(0xFF4D2C7A), // PART: near base purple
    Color(0xFF42206E), // 2: deeper purple tone
    Color(0xFF33185C), // PART: dark violet
    Color(0xFF1E0A33), // 1: very dark purple
    Color(0xFF1E0A33), // 1: very dark purple
  ];


}