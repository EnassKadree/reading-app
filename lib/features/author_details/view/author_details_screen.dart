import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/features/author_details/view/widgets/author_books_section.dart';
import 'package:reading_app/features/author_details/view/widgets/image_name_container.dart';
import 'package:reading_app/features/shared/models/author.dart';
import 'package:reading_app/features/shared/widgets/sliver_app_bar.dart';

class AuthorDetailsScreen extends StatelessWidget {
  const AuthorDetailsScreen({ required this.author,super.key});
 final Author author;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ImageNameContainer(author: author,),
          ),
      SliverPadding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        sliver: AuthorBooksSection(authorId: author.id,)
      )
    ],
  ),
    );
  }
}
