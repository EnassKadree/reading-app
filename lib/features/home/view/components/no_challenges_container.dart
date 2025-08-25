import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import '../../../../core/utils/constants/assets_consts.dart';
import '../../../../core/utils/constants/styles_consts.dart';
import '../../../challenges/UI/screens/challenges_screen.dart';

class NoChallengesContainer extends StatelessWidget {
  const NoChallengesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(20.r),
      ),
      padding: EdgeInsets.only(right: 16.w, top: 16.h, bottom: 16.h),
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Lottie.asset(
            AssetsConsts.activeChallengeIcon,
            width: 120.w,
            height: 120.h,
            repeat: false,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 200.w,
                child: AutoSizeText(
                  'Yet No Challenges?',
                  style: StylesConsts.f20W600Yellow,
                  maxLines: 3,
                ),
              ),
              SizedBox(
                width: 230.w,
                child: AutoSizeText(
                  '''Boost Your points and claim 
        your spot at the top''',
                  style: StylesConsts.f14W400Black,
                  maxLines: 3,
                ),
              ),
              20.spaceH,
              GestureDetector(
                onTap: () {
                  context.push(const ChallengesScreen());
                },
                child: Container(
                  width: 100,
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                    color: context.colorScheme.tertiary.withAlpha(150),
                    border: Border.all(
                        color: context.colorScheme.tertiary, width: 1.7),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Center(
                    child: Text('Join', style: StylesConsts.f18W600White),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
