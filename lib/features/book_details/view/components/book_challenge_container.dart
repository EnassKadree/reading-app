import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:reading_app/core/utils/constants/assets_consts.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/book_details/view/components/book_details_button.dart';
import 'package:reading_app/features/book_details/view/components/join_book_challenge_builder.dart';
import 'package:reading_app/features/shared/models/book_challenge.dart';

import '../../../shared/models/book.dart';
import '../../../shared/widgets/icon_text_widget.dart';

class BookChallengeContainer extends StatelessWidget {
  const BookChallengeContainer({  required this.book,required this.bookChallenge,super.key});
 final BookChallenge bookChallenge;
final BookModel book;
  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        Row(
          crossAxisAlignment:CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Lottie.asset(AssetsConsts.bookChallengeAsset,width: 110.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width:240.w,child: AutoSizeText(maxLines: 1,"challenge_your_self".t(context),style: StylesConsts.f23W600Yellow.copyWith(),)),
               10.spaceH,
               SizedBox(width:240.w,child: AutoSizeText(bookChallenge.description,maxLines:4,style:StylesConsts.f15W400Grey)),
              ],
            ),
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconTextWidget(whiteColor:false,text: "${bookChallenge.duration} days", icon: Icons.access_time_sharp),
            20.spaceW,
            IconTextWidget(whiteColor: false,text: "${bookChallenge.points} points", icon: Icons.star_border_purple500),
            20.spaceW,
            (book.isChallenged)?
            JoinBookChallengeBuilder( bookId: book.id,): BookDetailsButton(color: context.colorScheme.tertiary.withAlpha(120),function:(){},buttonText: 'joined')
          ],
        ).verticalPadding,
      ],
    );
  }
}
