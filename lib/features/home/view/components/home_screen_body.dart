import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/lists/dummy_categories.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/home/services/all_books/all_books_cubit.dart';
import 'package:reading_app/features/home/view/components/home_search_bar.dart';
import 'package:reading_app/features/home/view/screens/all_books_screen.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/utils/constants/json_consts.dart';
import '../../../../core/utils/constants/styles_consts.dart';
import '../../../../core/utils/functions/functions.dart';
import '../../../shared/models/author.dart';
import '../../../shared/models/book.dart';
import '../../../shared/models/category.dart';
import '../../../shared/models/user_challenge.dart';
import 'authors_section.dart';
import 'books_section.dart';
import 'categories_section.dart';
import 'home_purple_container.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody(
      {this.loading = false,
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
        SliverList(
          delegate: SliverChildListDelegate(
            [
              40.spaceH,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 90.h,
                      width: 320.w,
                      child: HomeSearchBar()),
                  GestureDetector(
                    onTap: () {
                      Functions().showSettingsDialog(context);
                    },
                    child: Icon(
                      Iconsax.menu_14,
                      color:  context.colorScheme.primary,
                    ).horizontalPadding,
                  ),
                ],
              ),
              HomePurpleContainer(
                  loading: loading, userChallenges: userChallenges),
              SizedBox(
                child: Text(
                  JsonConsts.categories.t(context),
                  style: StylesConsts.f18W600Black.copyWith(
                      fontSize: 18, color: context.colorScheme.onPrimary),
                ).mainPadding,
              ),
              5.spaceH,
              Skeletonizer(
                  enabled: loading,
                  child: CategoriesSection(
                    categories: categories,
                  )),

              Text(
                JsonConsts.authors.t(context),
                style: StylesConsts.f18W600Black.copyWith(
                    fontSize: 18, color: context.colorScheme.onPrimary),
              ).mainPadding,
              Skeletonizer(
                  enabled: loading,
                  child: AuthorsSection(
                    authors: authors,
                  )),
              5.spaceH,
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    JsonConsts.mostRatedBooks.t(context),
                    style: StylesConsts.f18W600Black.copyWith(
                        fontSize: 18, color: context.colorScheme.onPrimary),
                  ).mainPadding,
                  TextButton(
                      onPressed: () {
                        context.read<AllBooksCubit>().getAllBooks();
                        context.push(AllBooksScreen());
                      },
                      child: Text(
                        textAlign: TextAlign.end,
                        JsonConsts.viewAll.t(context),
                        style: StylesConsts.f20W600Yellow
                            .copyWith(fontSize: 14.sp),
                      ).horizontalPadding),
                ],
              ),
            ],
          ),
        ),
        if(books.isNotEmpty)
        SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: BooksSection(
              loading: loading,
              books: books,
            )),
      ],
    );
  }
}
