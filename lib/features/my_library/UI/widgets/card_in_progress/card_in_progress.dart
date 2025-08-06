import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/features/my_library/UI/widgets/card_in_progress/book_details_card.dart';
import 'package:reading_app/features/my_library/UI/widgets/card_in_progress/book_image.dart';
import 'package:reading_app/features/shared/models/book.dart';

class CardInProgress extends StatelessWidget {
  final BookModel book;
  const CardInProgress({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      child: SafeArea(
        child: SizedBox(
       //   height: MediaQuery.of(context).size.height * 0.14,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              BookDetailsCard(book: book),
              BookImage(book: book),
            ],
          ),
        ),
      ),
    );
  }
}
