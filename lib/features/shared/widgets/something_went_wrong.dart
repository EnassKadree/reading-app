import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/constants/colors_consts.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';

class SomeThingWentWrongWidget extends StatelessWidget {
  const SomeThingWentWrongWidget({
    super.key,
    required this.onPressed,
    this.title,
    this.message,
    this.buttonText,
  });

  final void Function()? onPressed;
  final String? title;
  final String? message;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Error icon with animated background
            Container(
              padding: EdgeInsets.all(32.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    context.colorScheme.primary.withOpacity(0.1),
                    Colors.purple[500]!.withOpacity(0.1),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.withOpacity(0.1),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Icon(
                Iconsax.warning_2,
                size: 80.sp,
                color: context.colorScheme.primary.withOpacity(0.7),
              ),
            ),

            32.spaceH,

            // Title text
            Text(
              title ?? JsonConsts.someThingWentWrong.t(context),
              style: StylesConsts.f18W600Black.copyWith(
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
                color: Colors.purple[800],
              ),
              textAlign: TextAlign.center,
            ),

            16.spaceH,

            // Message text
            Text(
              message ?? JsonConsts.checkYourConnection.t(context),
              style: StylesConsts.f15W400Grey.copyWith(
                fontSize: 16.sp,
                color: Colors.grey[600],
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),

            40.spaceH,

            // Retry button with gradient
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ColorsConsts.purple,
                    ColorsConsts.purple.withOpacity(0.8),
                  ],
                ),
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: ColorsConsts.purple.withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(16.r),
                  onTap: onPressed,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 32.w,
                      vertical: 16.h,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Iconsax.refresh,
                          color: Colors.white,
                          size: 20.sp,
                        ),
                        12.spaceW,
                        Text(
                          buttonText ?? JsonConsts.tryAgain.t(context),
                          style: StylesConsts.f16W600Black.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            24.spaceH,
          ],
        ),
      ),
    );
  }
}
