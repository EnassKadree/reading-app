import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/shared/models/book.dart';
import 'package:reading_app/features/shared/widgets/sliver_app_bar.dart';

import '../book_card/book_card.dart';

class ListOfBooksScreen extends StatelessWidget {
  const ListOfBooksScreen(
      {required this.title,  this.bookList, super.key});

  final String title;
  final List<BookModel>? bookList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverBar(
            title: title,
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 30.h,horizontal: 20.w),
            sliver: AnimationLimiter(
                child: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return const BookCard().staggeredGrid(index);
                    },
                    childCount: 20,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
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
