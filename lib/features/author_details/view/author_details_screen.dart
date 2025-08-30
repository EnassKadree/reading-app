import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/author_details/view/widgets/author_books_section.dart';
import 'package:reading_app/features/author_details/view/widgets/image_name_container.dart';
import 'package:reading_app/features/author_details/view/widgets/author_search_bar.dart';
import 'package:reading_app/features/shared/models/author.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';

class AuthorDetailsScreen extends StatelessWidget {
  const AuthorDetailsScreen({required this.author, super.key});

  final Author author;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      body: CustomScrollView(
        slivers: [
          // Enhanced author header
          SliverToBoxAdapter(
            child: ImageNameContainer(author: author),
          ),

          // Search bar section
          SliverToBoxAdapter(
            child: AuthorSearchBar(authorId: author.id),
          ),
           SliverToBoxAdapter(
             child:
             Row(
               children: [
                 Icon(
                   Iconsax.book_1,
                   color: context.colorScheme.primary,
                   size: 20,
                 ),
                 SizedBox(width: 12.w),
                 Text(
                   JsonConsts.books.t(context),
                   style: TextStyle(
                     fontSize: 20.sp,
                     fontWeight: FontWeight.w700,
                     color: context.colorScheme.onSurface,
                   ),
                 ),

               ],
             ).horizontalPadding,
           ),
          // Books section
          SliverPadding(
            padding: EdgeInsetsDirectional.only(start: 20.w,top: 10.h,bottom: 10.h),
              sliver: AuthorBooksSection(authorId: author.id)),
        ],
      ),
    );
  }
}
