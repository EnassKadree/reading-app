import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';

import '../../../../core/utils/constants/styles_consts.dart';
import '../../../../core/utils/functions/functions.dart';
import 'bottom_sheet_content.dart';

class AddACommentButton extends StatelessWidget {
  const AddACommentButton({ required this.function,super.key});
 final Function function;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
      function();
      },
      style: TextButton.styleFrom(
        side: BorderSide(
          color: context.colorScheme.primary
        ),
        backgroundColor:
        context.colorScheme.primary.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),

        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Text(
          "Add a Comment",
          style: StylesConsts.f20W600Yellow.copyWith(
            color: context.colorScheme.primary,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
