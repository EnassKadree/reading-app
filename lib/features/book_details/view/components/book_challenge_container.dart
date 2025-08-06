import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:reading_app/core/utils/constants/assets_consts.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/shared/models/book_challenge.dart';

import '../../../shared/widgets/icon_text_widget.dart';

class BookChallengeContainer extends StatelessWidget {
  const BookChallengeContainer({ required this.bookChallenge,super.key});
 final BookChallenge bookChallenge;
  @override
  Widget build(BuildContext context) {
    return   Container(
            width: 1.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: context.colorScheme.surfaceContainer,
        boxShadow:[
          BoxShadow(
          color: Colors.grey.shade300,
          spreadRadius: 1,
          blurRadius: 7,
        )]
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              Lottie.asset(AssetsConsts.bookChallengeAsset,width: 110),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("challenge_your_self".t(context),style: StylesConsts.f23W600Yellow,),
                 10.spaceH,
                 SizedBox(width:200,child: Text(bookChallenge.description,maxLines:4,style:StylesConsts.f15W400Grey)),
                ],
              ).verticalPadding,
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconTextWidget(whiteColor:false,text: "${bookChallenge.duration} days", icon: Icons.access_time_sharp),
              30.spaceW,
              IconTextWidget(whiteColor: false,text: "${bookChallenge.points} points", icon: Icons.star_border_purple500),
              30.spaceW,
              Container(

                padding: EdgeInsets.symmetric(horizontal: 5.w),
                height: 30.h,
                width: 90.w,
                decoration: BoxDecoration(
                  boxShadow:[ BoxShadow(
                    color: context.colorScheme.secondary,
                    spreadRadius: 1,
                    blurRadius: 1,
                  )],
                  color: context.colorScheme.secondary.withAlpha(150),
                  border: Border.all(color: context.colorScheme.secondary, width: 1.7),
                  borderRadius: BorderRadius.circular(15.r),
                ),
               child: Center(child: Text('Join',style: StylesConsts.f18W600White)),
              )
            ],
          ).verticalPadding,
        ],
      ),
    ).mainPadding;
  }
}
