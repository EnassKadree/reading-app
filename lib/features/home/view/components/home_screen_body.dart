
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/utils/constants/json_consts.dart';
import '../../../../core/utils/constants/styles_consts.dart';
import '../../../shared/models/author.dart';
import '../../../shared/models/book.dart';
import '../../../shared/models/category.dart';
import '../../../shared/models/user_challenge.dart';
import '../../../shared/widgets/sliver_app_bar.dart';
import 'authors_section.dart';
import 'books_section.dart';
import 'categories_section.dart';
import 'home_purple_container.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    this.loading=false,
    required this.userChallenges,
    required this.authors,
    required this.books,
    required this.categories,
    super.key});
   final bool loading;
  final List<BookModel> books;
  final List<Author> authors;
  final List<CategoryModel> categories;
  final List<UserChallenge> userChallenges;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverBar(
          whiteColor: false,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              HomePurpleContainer( loading:loading ,userChallenges:userChallenges),
              SizedBox(
                child: Text(
                  JsonConsts.categories.t(context),
                  style: StylesConsts.f18W600Black.copyWith(fontSize: 23),
                ).mainPadding,
              ),
              5.spaceH,
              Skeletonizer(enabled :loading,child: CategoriesSection(categories: categories,)),
              5.spaceH,
              Text(
                JsonConsts.authors.t(context),
                style: StylesConsts.f18W600Black.copyWith(fontSize: 23),
              ).mainPadding,
              Skeletonizer(enabled :loading,child: AuthorsSection(authors: authors,)),
              5.spaceH,
              Text(
                JsonConsts.mostRatedBooks.t(context),
                style: StylesConsts.f18W600Black.copyWith(fontSize: 23),
              ).mainPadding,
            ],
          ),
        ),
        SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: BooksSection(loading:loading,books:books ,)),
      ],
    );
  }
}
