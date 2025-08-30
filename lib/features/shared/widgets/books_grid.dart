import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/shared/models/book.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/utils/constants/json_consts.dart';
import '../../../core/utils/constants/styles_consts.dart';
import 'book_card/book_card.dart';

class BooksGrid extends StatelessWidget {
  const BooksGrid({ this.loading=false,required this.books,super.key});
 final List<BookModel>books;
 final bool loading;
  @override
  Widget build(BuildContext context) {
    if(books.isNotEmpty) {
      return   SliverPadding(
        padding: EdgeInsetsDirectional.only(start: 20.w,top: 25.h,bottom: 10.h),
        sliver:SliverGrid(
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return Skeletonizer(
                enabled: loading,
                child: BookCard(
                  bookModel:books[index] ,
                ).staggeredGrid(index),
              );
            },
            childCount: books.length,
          ),
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.h,
            childAspectRatio: 0.6,
          ),
        ),
    );
    } else {
      return   SliverFillRemaining(
        child: SizedBox(
          height: 200,
          width: 500.w,
          child: Center(
            child: Text(
              JsonConsts.thereAreNoBooksCurrently.t(context),
              style: StylesConsts.f18W600Black.copyWith(color: context.colorScheme.primary),
            ),
          ),
        ),
      );
    }
  }
}
