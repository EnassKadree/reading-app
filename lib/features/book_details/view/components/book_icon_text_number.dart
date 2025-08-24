import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';

class BookIconTextNumber extends StatelessWidget {
  const BookIconTextNumber({ required this.title,required this.info, required this.icon,super.key});
    final IconData icon;
    final String title;
    final String info;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.0.w,vertical: 4.h),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              color: context.colorScheme.secondaryContainer.withAlpha(50),
              spreadRadius: 1,

            )
          ],
          color:context.colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(8.0.r),
         // border: Border.all(color:context.colorScheme.secondary,width: 1.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: context.colorScheme.secondary,
              size: 22.0,
            ),
            10.spaceW,
            Column(
              children: [
                Text(title ,style: StylesConsts.f18W400grey.copyWith(fontSize: 12)),
                2.spaceH,
                SizedBox(
                  width: 70.w,
                  child: Text(
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    info,
                    style:StylesConsts.f14W400Black
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
