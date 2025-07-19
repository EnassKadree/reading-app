import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/shared/models/book.dart';
import 'package:reading_app/features/shared/widgets/sliver_app_bar.dart';

import '../book_card/book_card.dart';

class ListOfBooksSliver extends StatelessWidget {
  const ListOfBooksSliver({
  
    required this.bookList,
    super.key,
  });

 
  final List<BookModel> bookList;

  @override
  Widget build(BuildContext context) {
    return 
        AnimationLimiter(
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
              return BookCard(book: bookList[index]).staggeredGrid(index);
            },
          ),
        );
     
    
  }
}
