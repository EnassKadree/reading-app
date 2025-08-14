import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/features/profile/UI/screens/profile_screen.dart';
import 'package:reading_app/features/profile/UI/widgets/profile_circle_avatar.dart';
import 'package:reading_app/features/shared/models/profile_model.dart';
import 'package:reading_app/features/shared/widgets/custom_white_container.dart';

class ListTileCard extends StatelessWidget {
  const ListTileCard({
    super.key,
    required this.profile,
    required this.index,
    this.verticalMargin = 4,
    this.horizontalMargin = 2,
    required this.isArranged,
  });
  final ProfileModel profile;
  final int index;
  final double verticalMargin;
  final double horizontalMargin;
  final bool isArranged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(ProfileScreenWrapper(userId: profile.userId,));
      },
      child: CustomWhiteContainer(
        margin: EdgeInsets.symmetric(
            vertical: verticalMargin, horizontal: horizontalMargin),
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        child: Row(
          children: [
            isArranged
                ? Text(
                    index.toString(),
                    style: StylesConsts.f18W600Black
                        .copyWith(color: context.colorScheme.secondary),
                  )
                : 0.spaceH,
            ProfileCircleAvatar(
              picture: profile.picture,
              height: 64.h,
            ),
            10.spaceW,
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${profile.firstName} ${profile.lastName}',
                  style: StylesConsts.f16W600Black.copyWith(),
                ),
                2.spaceH,
                Text(
                  profile.nickname,
                  style: StylesConsts.f15W400Grey.copyWith(
                    color: context.colorScheme.primary.withOpacity(.5),
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Icon(
              Iconsax.star1,
              size: 18,
              color: Colors.amber,
            ),
            4.spaceW,
            Text(
              profile.totalPoints.toString(),
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
