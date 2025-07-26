import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:reading_app/core/utils/constants/assets_consts.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/features/shared/widgets/icon_text_widget.dart';
import 'package:reading_app/features/shared/models/user_challenge.dart';

import '../../../../core/utils/extensions/space_extension.dart';

class ActiveChallengeCard extends StatelessWidget {
  const ActiveChallengeCard({ required this.userChallenge,super.key});
 final UserChallenge userChallenge;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(20.r),
      ),
      padding: EdgeInsets.only(right: 16.w, top: 16.h, bottom: 16.h),
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      // width: 310,
      child: Row(
        children: [
          Lottie.asset(
            AssetsConsts.activeChallengeIcon,
            width: 120.w,
            height: 120.h,
            repeat: false,
          ),
          10.spaceH,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
               userChallenge.title,
                style: StylesConsts.f18W600Black,
              ),
              10.spaceH,
              SizedBox(
                width: 170.w,
                child: LinearProgressIndicator(
                  value: userChallenge.percentage/100,
                  backgroundColor: Colors.grey[350],
                  color: context.colorScheme.tertiary,
                  minHeight: 5,
                ),
              ),
              15.spaceH,
              Row(
                children: [
                   IconTextWidget(
                    text: "${userChallenge.timeLeft}d left",
                    icon: Icons.hourglass_bottom,
                    iconSize: 14,
                  ),
                  10.spaceW,
                   IconTextWidget(
                    text: "${userChallenge.points}points",
                    icon: Icons.star,
                    iconSize: 14,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
