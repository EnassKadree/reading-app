import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';

import '../../../../core/utils/constants/styles_consts.dart';

class CantRateOrComment extends StatelessWidget {
  const CantRateOrComment({ required this.cantString,super.key});
final String cantString;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: Colors.orange.withOpacity(0.6),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.info_outline,
            color: Colors.orange,
            size: 16.sp,
          ),
          8.spaceW,
          Expanded(
            child: Text(
              cantString,
              style: StylesConsts.f15W400Grey.copyWith(
                fontSize: 13.sp,
                color: Colors.orange,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
