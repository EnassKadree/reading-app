import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/book_details/view/components/book_details_white_container.dart';
import 'package:reading_app/features/shared/widgets/mini_some_thing_went_wrong_widget.dart';
import 'package:reading_app/features/shared/widgets/something_went_wrong.dart';
import '../../../../core/utils/constants/assets_consts.dart';
import '../../../shared/models/book.dart';
import '../../service/book_challenge/book_challenge_cubit.dart';
import '../../service/book_challenge/book_challenge_states.dart';
import 'book_challenge_container.dart';

class BookChallengeBuilder extends StatelessWidget {
  const BookChallengeBuilder({required this.book, super.key});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return BookDetailsWhiteContainer(
      maxHeight: 200.h,
      child: BlocBuilder<BookChallengeCubit, BookChallengeStates>(
        builder: (BuildContext context, BookChallengeStates state) {
          if (state is BookChallengeSuccess) {
            return BookChallengeContainer(
              bookChallenge: state.bookChallenge,
              book: book,
            );
          } else if (state is BookChallengeLoading) {
            return Center(
              child: SizedBox(
                height: 80.h,
                width: 80.w,
                child: Lottie.asset(AssetsConsts.loadingAsset),
              ),
            );
          }
          return MiniSomeThingWentWrongWidget(onPressed: () {
            context.read<BookChallengeCubit>().getBookChallenge(book.id);
          });
        },
      ),
    ).horizontalPadding;
  }
}
