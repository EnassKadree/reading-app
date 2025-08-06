import 'package:flutter/material.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/shared/models/book.dart';

import 'book_icon_text_number.dart';

class BookNumbersSection extends StatelessWidget {
  const BookNumbersSection({ required this.book,super.key});
 final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BookIconTextNumber(title: 'Reads', info: '${book.readersCount}', icon: Icons.people_alt_outlined) ,
            10.spaceW,
            BookIconTextNumber(title: 'Rating', info: '${book.starRate}', icon: Icons.star_border_outlined) ,
            10.spaceW,
            BookIconTextNumber(title: 'Date', info: book.publishDate.substring(0,4), icon: Icons.date_range_outlined) ,
          ],),
        20.spaceH,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BookIconTextNumber(title: 'Category', info: book.categoryName, icon: Icons.category_outlined) ,
            10.spaceW,
            BookIconTextNumber(title: 'Size', info: book.sizeCategoryName, icon: Icons.menu_book_rounded) ,
            10.spaceW,
            BookIconTextNumber(title: 'Pages', info: '${book.numberOfPages}', icon: Icons.library_books_outlined) ,
          ],
        ),
      ],
    ).horizontalPadding;
  }
}
