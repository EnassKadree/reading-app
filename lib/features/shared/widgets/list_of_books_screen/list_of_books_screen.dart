import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/shared/widgets/sliver_app_bar.dart';

import '../../../../core/utils/constants/colors_consts.dart';
import '../../../../core/utils/constants/json_consts.dart';
import '../../../../core/utils/constants/styles_consts.dart';
import '../../models/book.dart';
import '../book_card/book_card.dart';

class ListOfBooksScreen extends StatelessWidget {
  const ListOfBooksScreen({required this.title, required this.bookList, super.key});

  final String title;
  final List<BookModel> bookList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverBar(
            menuVisibility: false,
            searchVisibility: false,
            backButtonVisibility: true,
            title: title,
          ),
          bookList.isNotEmpty
              ? SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 16.w),
            sliver: AnimationLimiter(
              child: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return BookCard(bookModel: bookList[index])
                        .staggeredGrid(index);
                  },
                  childCount: bookList.length,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: 0.6,
                ),
              ),
            ),
          )
              :
          SliverFillRemaining(
            child: SizedBox(
              height: 200,
              width: 500.w,
              child: Center(
                child: Text(
                  JsonConsts.thereAreNoBooksCurrently.t(context),
                  style: StylesConsts.f18W600Black.copyWith(color: ColorsConsts.purple),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
