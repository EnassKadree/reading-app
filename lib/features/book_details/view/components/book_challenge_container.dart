import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:reading_app/core/utils/constants/assets_consts.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/book_details/view/components/join_book_challenge_builder.dart';
import 'package:reading_app/features/shared/models/book_challenge.dart';

import '../../../shared/widgets/icon_text_widget.dart';

class BookChallengeContainer extends StatelessWidget {
  const BookChallengeContainer({  required this.bookId,required this.bookChallenge,super.key});
 final BookChallenge bookChallenge;
final int bookId;
  @override
  Widget build(BuildContext context) {
    return   Column(
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
            JoinBookChallengeBuilder(bookId: bookId,)
          ],
        ).verticalPadding,
      ],
    );
  }
}
