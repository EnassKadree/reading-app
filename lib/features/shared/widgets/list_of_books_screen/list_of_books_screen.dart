import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/shared/widgets/sliver_app_bar.dart';
import '../../models/book.dart';
import '../book_card/book_card.dart';

class ListOfBooksScreen extends StatelessWidget {
  const ListOfBooksScreen(
      {required this.title, required this.bookList, super.key});

  final String title;
  final List<BookModel> bookList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverBar(
            menuVisibility: true,
            backButtonVisibility: true,
            title: title,
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 30.h,horizontal: 16.w),
            sliver: AnimationLimiter(
              child: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return  BookCard(bookModel: bookList[index],).staggeredGrid(index);
                  },
                  childCount: bookList.length,
                ),
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: 0.6,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
