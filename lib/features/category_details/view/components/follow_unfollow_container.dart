import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:iconsax/iconsax.dart';

class FollowUnfollowContainer extends StatelessWidget {
  const FollowUnfollowContainer({ this.isLoading=false,required this.isFollowed,super.key});
  final bool isFollowed ;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      constraints: BoxConstraints(
        minWidth: 110.w
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            context.colorScheme.primary,
            context.colorScheme.tertiary,
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(18.r),
          topLeft: Radius.circular(18.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 6),
          )
        ],
      ),
      child:(!isLoading)?
      Row(
        children: [
          14.spaceW,
          Icon(
            isFollowed ? Iconsax.tick_circle : Iconsax.add_circle,
            size: 20,
            color: context.colorScheme.surfaceContainer,
          ),
          10.spaceW,
          Text(
            isFollowed? JsonConsts.unFollow.t(context):JsonConsts.follow.t(context),
            style: TextStyle(
              letterSpacing: 0.5,
              color: context.colorScheme.surfaceContainer,
              fontSize: 15.sp,
              decoration: TextDecoration.none,
            ),
          ),
          16.spaceW
        ],
      ):SizedBox(height:5,width:5,child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 38,vertical: 14),
        child: CircularProgressIndicator(color: context.colorScheme.surfaceContainer,),
      )),
    );
  }
}
