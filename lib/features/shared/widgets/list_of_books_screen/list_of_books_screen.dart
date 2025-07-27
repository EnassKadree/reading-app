import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/shared/models/book.dart';
import '../book_card/book_card.dart';

class ListOfBooksScreen extends StatelessWidget {
  const ListOfBooksScreen(
      {required this.title, required this.bookList, super.key});

  final List<BookModel> bookList;
  final String title;
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        itemCount: bookList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 0.6,
        ),
        itemBuilder: (context, index) {
          return BookCard(bookModel: bookList[index]).staggeredGrid(index);
        },
      ),
    );
  }
}
