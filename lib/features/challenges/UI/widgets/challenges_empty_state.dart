import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';

import '../../../../core/utils/constants/styles_consts.dart';
import '../../../../core/utils/constants/colors_consts.dart';

class ChallengesEmptyState extends StatelessWidget {
  const ChallengesEmptyState({
    super.key,
    required this.isCompletedChallenges,
    this.onRefresh,
  });

  final bool isCompletedChallenges;
  final VoidCallback? onRefresh;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon container with gradient background
            Container(
              padding: EdgeInsets.all(32.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ColorsConsts.purple.withOpacity(0.1),
                    ColorsConsts.gold.withOpacity(0.1),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: ColorsConsts.purple.withOpacity(0.1),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Icon(
                isCompletedChallenges ? Iconsax.medal : Iconsax.award,
                size: 80.sp,
                color: ColorsConsts.purple.withOpacity(0.6),
              ),
            ),

            32.spaceH,

            // Title text
            Text(
              isCompletedChallenges
                  ? JsonConsts.noCompletedChallenges.t(context)
                  : JsonConsts.noChallengesAvailable.t(context),
              style: StylesConsts.f18W600Black.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: ColorsConsts.purple,
              ),
              textAlign: TextAlign.center,
            ),

            16.spaceH,

            // Description text
            Text(
              isCompletedChallenges
                  ? JsonConsts.completeYourFirstChallengeToSeeItHere.t(context)
                  : JsonConsts.checkBackLaterForNewReadingChallenges.t(context),
              style: StylesConsts.f15W400Grey.copyWith(
                fontSize: 16.sp,
                color: Colors.grey[600],
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),

            32.spaceH,

            // Optional refresh button
            if (onRefresh != null)
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
                    onTap: onRefresh,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 12.h,
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
                            JsonConsts.refresh.t(context),
                            style: StylesConsts.f16W600Black.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
