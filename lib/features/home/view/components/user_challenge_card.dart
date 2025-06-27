import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:reading_app/core/utils/constants/assets_consts.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/features/home/view/components/icon_text_widget.dart';

import '../../../../core/utils/extensions/space_extension.dart';

class ActiveChallengeCard extends StatelessWidget {
  const ActiveChallengeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(20.r),
      ),
      padding:  EdgeInsets.only(right: 16.w,
        top: 16.h,bottom: 16.h
      ),
      margin:  EdgeInsets.symmetric(horizontal: 16.w),
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
              const Text(
                "ART challenge ",
                style: StylesConsts.f18W600Black,
              ),
              10.spaceH,
              SizedBox(
                width: 170.w,
                child: LinearProgressIndicator(
                  value: 0.6,
                  backgroundColor: Colors.grey[350],
                  color: context.colorScheme.tertiary,
                  minHeight: 5,
                ),
              ),
              15.spaceH,
              Row(
                children: [
                  const IconTextWidget(
                    text: "3d left",
                    icon: Icons.hourglass_bottom,
                    iconSize: 14,
                  ),
                  10.spaceW,
                  const IconTextWidget(
                    text: "100 points",
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
