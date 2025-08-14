import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/functions/functions.dart';
import 'package:reading_app/features/profile/UI/widgets/profile_circle_avatar.dart';
import 'package:reading_app/features/shared/models/profile_model.dart';

import '../../../../core/utils/constants/colors_consts.dart';

class LeaderboardWidget extends StatelessWidget {
  const LeaderboardWidget({super.key, required this.profiles});
  final List<ProfileModel> profiles;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: ColorsConsts.gradientColors.sublist(0, 4),
        ),
        borderRadius: BorderRadius.circular(16.0.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                if (profiles.length > 2)
                  Positioned(
                    bottom: -8.h,
                    right: 16.h,
                    child: _buildProfileItem(
                      imageUrl: profiles[2].picture,
                      points: profiles[2].totalPoints,
                      subtitle: profiles[2].nickname,
                      isWinner: false,
                      number: 3,
                      context: context,
                    ),
                  ),
                if (profiles.length > 1)
                  Positioned(
                    bottom: -8.h,
                    left: 16.h,
                    child: _buildProfileItem(
                      imageUrl: profiles[1].picture,
                      points: profiles[1].totalPoints,
                      subtitle: profiles[1].nickname,
                      isWinner: false,
                      number: 2,
                      context: context,
                    ),
                  ),
                if (profiles.isNotEmpty)
                  _buildProfileItem(
                    imageUrl: profiles[0].picture,
                    points: profiles[0].totalPoints,
                    subtitle: profiles[0].nickname,
                    isWinner: true,
                    number: 1,
                    context: context,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileItem(
      {required String imageUrl,
      required int points,
      required String subtitle,
      required bool isWinner,
      required int number,
      required BuildContext context}) {
    return Column(
      children: [
        ProfileCircleAvatar(
          picture: imageUrl,
          height: isWinner ? 150 : 100,
          margin: 0,
          borderColor: isWinner ? Colors.yellow : null,
        ),
        // 4.spaceH,
        // _buildStarIcon(isWinner, number),
        8.spaceH,
        Text('${Functions().formatPoints(points)} Pts',
            style: StylesConsts.f16W600Black.copyWith(
                color: Colors.white, fontSize: isWinner ? 16.sp : 14.sp)),
        4.spaceH,
        Text(subtitle,
            style: StylesConsts.f15W400Grey
                .copyWith(fontSize: isWinner ? 16.sp : 14.sp)),
        16.spaceH,
      ],
    );
  }
}
