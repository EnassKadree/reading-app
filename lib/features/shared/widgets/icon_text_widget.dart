import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import '../../../core/utils/constants/styles_consts.dart';

class IconTextWidget extends StatelessWidget {
  const IconTextWidget(
      {this.iconSize = 18, required this.text, required this.icon, super.key});

  final String text;
  final IconData icon;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      height: 30.h,
      decoration: BoxDecoration(
        border: Border.all(color: context.colorScheme.secondary, width: 1.7),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //  spacing: 5,
        children: [
          Icon(icon, size: iconSize, color: context.colorScheme.secondary),
          4.spaceW,
          Text(
            text,
            style: StylesConsts.f16W600Black,
          ),
        ],
      ),
    );
  }
}
