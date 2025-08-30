import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:reading_app/core/utils/constants/assets_consts.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/features/book_details/view/components/book_details_button.dart';
import 'package:reading_app/features/book_details/view/components/join_book_challenge_builder.dart';
import 'package:reading_app/features/shared/models/book_challenge.dart';

import '../../../shared/models/book.dart';
import '../../../shared/widgets/icon_text_widget.dart';

class BookChallengeContainer extends StatelessWidget {
  const BookChallengeContainer({ 
    required this.book,
    required this.bookChallenge,
    super.key
  });
  
  final BookChallenge bookChallenge;
  final BookModel book;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Lottie.asset(
              AssetsConsts.bookChallengeAsset,
              width: 110.w
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.spaceH,
                  AutoSizeText(
                    maxLines: 1,
                    "Challenge Yourself",
                    style: StylesConsts.f23W600Yellow.copyWith(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  8.spaceH,
                  SizedBox(
                    height: 60.h,
                    child: AutoSizeText(
                      bookChallenge.description,

                      style: StylesConsts.f15W400Grey.copyWith(
                        fontSize: 14.sp,
                        color: context.colorScheme.onSurface.withOpacity(0.7),
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        24.spaceH,

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconTextWidget(
              whiteColor: false,
              text: "${bookChallenge.duration} days",
              icon: Iconsax.timer
            ),
            10.spaceW,
            IconTextWidget(
              whiteColor: false,
              text: "${bookChallenge.points} points",
              icon: Iconsax.star4
            ),
            10.spaceW,
            (!book.isChallenged)
              ? JoinBookChallengeBuilder(bookId: book.id)
              : BookDetailsButton(
                  color: context.colorScheme.tertiary.withAlpha(120),
                  function: () {},
                  buttonText: 'Joined'
                )
          ],
        ),
      ],
    );
  }
}
