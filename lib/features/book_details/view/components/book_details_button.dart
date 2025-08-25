import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';

import '../../../../core/utils/constants/styles_consts.dart';

class BookDetailsButton extends StatelessWidget {
  const BookDetailsButton({ required this.buttonText,super.key});
final String buttonText;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      height: 30.h,
      width: 90.w,
      decoration: BoxDecoration(
        boxShadow:[ BoxShadow(
       color:    context.colorScheme.tertiary.withAlpha(120),
          spreadRadius: 1,
          blurRadius: 1,
        )],
        border: Border.all(color: context.colorScheme.tertiary.withAlpha(200), width: 1.7),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Center(child: Text(buttonText,style: StylesConsts.f18W600White)),
    );
  }
}
