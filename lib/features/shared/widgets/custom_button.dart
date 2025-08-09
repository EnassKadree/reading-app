import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';

import '../../../core/utils/constants/styles_consts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, this.onPressed, required this.title, this.radius = 32});
  final void Function()? onPressed;
  final String title;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          backgroundColor: context.theme.primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius.r)),
          padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 14.w),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Text(
          title.t(context),
          style: StylesConsts.introText,
        ));
  }
}
