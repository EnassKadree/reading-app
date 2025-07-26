import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';

class NoChallengesContainer extends StatelessWidget {
  const NoChallengesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(20.r),
      ),
      padding: EdgeInsets.only(right: 16.w, top: 16.h, bottom: 16.h),
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      // width: 310,

    );
  }
}
