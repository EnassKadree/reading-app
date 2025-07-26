import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/shared/models/book.dart';
import '../../../shared/widgets/book_card/book_card.dart';

class BooksSection extends StatelessWidget {
  const BooksSection({required this.books,super.key});
 final List<BookModel>books;
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: SliverGrid(
        delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
            return BookCard(
              bookModel:books[index] ,
            ).staggeredGrid(index);
          },
          childCount: books.length,
        ),
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
          childAspectRatio: 0.6,
        ),
      ),
    );
  }
}
