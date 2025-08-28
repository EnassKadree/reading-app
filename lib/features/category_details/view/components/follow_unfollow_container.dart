import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';

class FollowUnfollowContainer extends StatelessWidget {
  const FollowUnfollowContainer({ this.isLoading=false,required this.isFollowed,super.key});
  final bool isFollowed ;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      constraints: BoxConstraints(
        minWidth: 100.w
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.primary.withAlpha(200),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          topLeft: Radius.circular(20.r),
        ),
      ),
      child:(!isLoading)?
      Row(
        children: [
          13.spaceW,
          Icon(Icons.add_circle_outline,
              size: 20,
              color: context.colorScheme.surfaceContainer),
          13.spaceW,
          Text(
           isFollowed? JsonConsts.unFollow.t(context):JsonConsts.follow.t(context),
            style: TextStyle(
              letterSpacing: 0.6,
              color: context.colorScheme.surfaceContainer,
              fontSize: 16.sp,
              decoration: TextDecoration.none,
            ),
          ),
          15.spaceW
        ],
      ):SizedBox(height:5,width:5,child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 14),
        child: CircularProgressIndicator(color: context.colorScheme.surfaceContainer,),
      )),
    );
  }
}
