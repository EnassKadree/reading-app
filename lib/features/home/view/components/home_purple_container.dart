import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/home/view/components/user_challenges_section.dart';
import 'package:reading_app/features/shared/models/user_challenge.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/utils/constants/json_consts.dart';

class HomePurpleContainer extends StatelessWidget {
  const HomePurpleContainer({this.loading=false, required this.userChallenges,super.key});
 final List<UserChallenge>userChallenges;
final bool loading ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
        borderRadius:  BorderRadius.only(
          bottomLeft: Radius.circular(40.r),
          bottomRight: Radius.circular(40.r),
        ),
      ),
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            JsonConsts.activeChallenges.t(context),
             style:StylesConsts.f30W500White,
             textAlign: TextAlign.start,
           ).horizontalPadding,
          5.spaceH,
           Skeletonizer(
          enabled :loading,
             child: SizedBox(
             // height: 130.h,
              child:  UserChallengesSection(userChallenges: userChallenges,),
                       ).verticalPadding,
           ),
          10.spaceH,
        ],
      ),
    );
  }
}
