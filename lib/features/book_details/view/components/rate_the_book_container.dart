import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:reading_app/core/utils/constants/assets_consts.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/book_details/service/rate_the_book/rate_the_book_cubit.dart';
import 'package:reading_app/features/book_details/service/rate_the_book/rate_the_book_states.dart';
import 'package:reading_app/features/shared/models/book.dart';

import '../../../../core/utils/functions/functions.dart';

class RateTheBookContainer extends StatelessWidget {
  const RateTheBookContainer({required this.book, super.key});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    double rate = 0;
    bool ignore = ((book.progress * 100) / book.numberOfPages) > 70;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textAlign: TextAlign.start,
          ' Rate the book',
          style: StylesConsts.f24BoldBlack,
        ),
        15.spaceH,
        IgnorePointer(
          ignoring: ignore,
          child: AnimatedOpacity(
            duration: Duration(seconds: 1),
            opacity: (ignore) ? 0.35 : 1,
            child: Container(
              width: 1.sw,
              constraints: BoxConstraints(minHeight: 70.h, maxHeight: 80.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: context.colorScheme.surfaceContainer,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 1,
                      blurRadius: 7,
                    )
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RatingBar(
                    initialRating: 0,
                    minRating: 1,
                    itemCount: 5,
                    itemSize: 27.0,
                    updateOnDrag: true,
                    allowHalfRating: false,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0.w),
                    direction: Axis.horizontal,
                    ratingWidget: RatingWidget(
                      full: Icon(Icons.star,
                          color: context.colorScheme.secondary),
                      empty: Icon(Icons.star_border,
                          color: context.colorScheme.secondary),
                      half: const Icon(Icons.star_half, color: Colors.amber),
                    ),
                    onRatingUpdate: (rating) {
                      rate = rating;
                    },
                  ),
                  GestureDetector(
                      onTap: () {
                        context
                            .read<RateTheBookCubit>()
                            .rateTheBook(book.id, rate);
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          height: 30.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color:
                                    context.colorScheme.tertiary.withAlpha(120),
                                spreadRadius: 1,
                                blurRadius: 1,
                              ),
                            ],
                            //color: context.colorScheme.tertiary.withAlpha(150),
                            border: Border.all(
                                color: context.colorScheme.tertiary,
                                width: 1.7),
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: BlocConsumer<RateTheBookCubit, RateState>(
                            builder: (BuildContext context, RateState state) {
                              if (state is LoadingRateState) {
                                return Lottie.asset(AssetsConsts.loadingAsset);
                              } else {
                                return Center(
                                        child: Text('Rate',
                                            style: StylesConsts.f18W600White))
                                    .horizontalPadding;
                              }
                            },
                            listener: (BuildContext context, RateState state) {
                              if (state is ErrorRateState) {
                                Functions()
                                    .showSnackBar(context, state.errorMessage);
                              }
                            },
                          )))
                ],
              ).mainPadding,
            ),
          ),
        ),
        5.spaceH,
        AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: (ignore) ? 1 : 0,
            child: Text(
              " can't rate the book till your 70%",
              style: StylesConsts.f15W400Grey
                  .copyWith(color: context.colorScheme.primary),
            ))
      ],
    ).horizontalPadding;
  }
}
