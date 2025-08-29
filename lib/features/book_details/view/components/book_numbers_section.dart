import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/features/shared/models/book.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'book_icon_text_number.dart';

class BookNumbersSection extends StatelessWidget {
  const BookNumbersSection({ required this.book,super.key});
 final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BookIconTextNumber(
                title: JsonConsts.reads.t(context),
                info: '${book.readersCount}', 
                icon: Iconsax.people
              ),
              10.spaceW,
              BookIconTextNumber(
                title: JsonConsts.rate.t(context),
                info: '${book.starRate}', 
                icon: Iconsax.star_1
              ),
              10.spaceW,
              BookIconTextNumber(
                title: JsonConsts.date.t(context),
                info: book.publishDate.substring(0,4), 
                icon: Iconsax.calendar
              ),
            ],
          ),
          24.spaceH,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BookIconTextNumber(
                title: JsonConsts.category.t(context),
                info: book.categoryName, 
                icon: Iconsax.category
              ),
              10.spaceW,
              BookIconTextNumber(
                title: JsonConsts.size.t(context),
                info: book.sizeCategoryName, 
                icon: Iconsax.book
              ),
              10.spaceW,
              BookIconTextNumber(
                title: JsonConsts.pages.t(context),
                info: '${book.numberOfPages}', 
                icon: Iconsax.book_1
              ),
            ],
          ),
        ],
      ),
    );
  }
}
