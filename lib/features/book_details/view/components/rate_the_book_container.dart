import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/book_details/service/rate_abillity/rate_abillity_cubit.dart';
import 'package:reading_app/features/book_details/service/rate_abillity/rate_abillity_states.dart';
import 'package:reading_app/features/book_details/view/components/book_details_white_container.dart';
import 'package:reading_app/features/book_details/view/components/cant_rate_or_comment.dart';
import 'package:reading_app/features/book_details/view/components/rate_button_builder.dart';
import 'package:reading_app/features/shared/models/book.dart';

class RateTheBookContainer extends StatelessWidget {
  const RateTheBookContainer({ required this.book, super.key});

  final BookModel book;


  @override
  Widget build(BuildContext context) {
    double rate = 1;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            JsonConsts.rateTheBook.t(context),
            style: StylesConsts.f20BoldBlack.copyWith(
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
              color: context.colorScheme.onSurface,
            ),
          ),
          BlocBuilder<RateAbilityCubit, RateAbilityStates>(
            builder: (BuildContext context, RateAbilityStates state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.spaceH,
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 1500),
                    opacity: !state.canRate ? 1 : 0,
                    child:  CantRateOrComment(
                        cantString:
                            JsonConsts.cannotRateTheBook.t(context)),
                  ),
                  if (!state.canRate) 15.spaceH,
                  IgnorePointer(
                    ignoring: !state.canRate,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 1500),
                      opacity: (!state.canRate) ? 0.35 : 1,
                      child: BookDetailsWhiteContainer(
                        maxHeight: 100.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: RatingBar(
                                initialRating: 1,
                                minRating: 1,
                                itemCount: 5,
                                itemSize: 28.sp,
                                updateOnDrag: true,
                                allowHalfRating: false,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 6.w),
                                direction: Axis.horizontal,
                                ratingWidget: RatingWidget(
                                  full: Icon(
                                    Icons.star,
                                    color: context.colorScheme.secondary,
                                  ),
                                  empty: Icon(
                                    Icons.star_border,
                                    color: context.colorScheme.secondary,
                                  ),
                                  half: const Icon(Icons.star_half,
                                      color: Colors.amber),
                                ),
                                onRatingUpdate: (rating) {
                                  rate = rating;
                                },
                              ),
                            ),
                            20.spaceW,
                            RateButtonBuilder(
                              bookId: book.id,
                              rate: rate,
                            ),
                          ],
                        ).mainPadding,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class RateTheBookWrapper extends StatelessWidget {
  const RateTheBookWrapper({this.newProgress, required this.book, super.key});

  final BookModel book;
  final int? newProgress;

  @override
  Widget build(BuildContext context) {
    bool ignore = (book.progress * 100) / book.numberOfPages > 70;
    return BlocProvider(
        create: (BuildContext context) {
          return RateAbilityCubit(ignore)
            ..updateCanRate(
                (newProgress == null) ? book.progress : newProgress!,
                book.numberOfPages);
        },
        child: RateTheBookContainer(
          book: book,

        ),
    );
  }
}
