import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:reading_app/core/utils/constants/assets_consts.dart';
import 'package:reading_app/core/utils/constants/colors_consts.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/book_details/service/rate_abillity/rate_abillity_cubit.dart';
import 'package:reading_app/features/book_details/service/rate_abillity/rate_abillity_states.dart';
import 'package:reading_app/features/book_details/service/rate_the_book/rate_the_book_cubit.dart';
import 'package:reading_app/features/book_details/service/rate_the_book/rate_the_book_states.dart';
import 'package:reading_app/features/book_details/view/components/book_details_button.dart';
import 'package:reading_app/features/shared/models/book.dart';
import 'package:reading_app/features/shared/widgets/custom_white_container.dart';

import '../../../../core/utils/functions/functions.dart';

class RateTheBookContainer extends StatelessWidget {
  const RateTheBookContainer({ this.newProgress, required this.book, super.key});

  final BookModel book;
  final int? newProgress;



  @override
  Widget build(BuildContext context) {
    bool ignore=(book.progress * 100) / book.numberOfPages>70;
    double rate = 1;
    return BlocProvider(
    create: (BuildContext context){
        return RateAbilityCubit(ignore)..updateCanRate((newProgress==null)?book.progress:newProgress!, book.numberOfPages);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textAlign: TextAlign.start,
            'Rate the book',
            style: StylesConsts.f24BoldBlack,
          ),
          5.spaceH,
          BlocBuilder<RateAbilityCubit, RateAbilityStates>(
            builder: (BuildContext context, RateAbilityStates state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 1500),
                    opacity: !state.canRate ? 1 : 0,
                    child: Text(
                      " can't rate the book till your 70%",
                      style: StylesConsts.f15W400Grey.copyWith(
                          fontSize: 12.sp),
                    ),
                  ),
                  IgnorePointer(
                    ignoring: !state.canRate,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds:1500),
                      opacity: (!state.canRate) ?0.35: 1,
                      child: CustomWhiteContainer(
                        padding:EdgeInsets.zero,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RatingBar(
                              initialRating: 1,
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
                              child: const BookDetailsButton(buttonText: 'Rate'),
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
      ).horizontalPadding,
    );
  }
}

