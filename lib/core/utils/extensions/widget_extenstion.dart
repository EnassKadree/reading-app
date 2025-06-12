import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

extension WidgetExtension on Widget {
  Widget get rtl =>
      Directionality(textDirection: TextDirection.rtl, child: this);

  //stagger list view animation
  Widget staggerListHorizontal(int index) =>
      AnimationConfiguration.staggeredList(
        position: index,
        duration: const Duration(milliseconds: 350),
        child: SlideAnimation(
          horizontalOffset: 50.0,
          child: FadeInAnimation(
            child: this,
          ),
        ),
      );

  Widget staggerListVertical(int index) => AnimationConfiguration.staggeredList(
        position: index,
        duration: const Duration(milliseconds: 350),
        child: SlideAnimation(
          verticalOffset: 50.0,
          child: FadeInAnimation(
            child: this,
          ),
        ),
      );

  Widget staggeredGrid(int index) => AnimationConfiguration.staggeredGrid(
        columnCount: 2,
        position: index,
        duration: const Duration(milliseconds: 350),
        child: ScaleAnimation(child: this),
      );

  Widget get horizontalPadding => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: this,
      );

  Widget get verticalPadding => Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: this,
      );

  Widget get mainPadding => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: this,
      );
}
