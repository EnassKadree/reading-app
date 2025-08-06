import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/home/services/authors/authors_states.dart';
import 'package:reading_app/features/home/services/books/books_cubit.dart';
import 'package:reading_app/features/home/services/books/books_states.dart';
import 'package:reading_app/features/home/services/categories/categories_cubit.dart';
import 'package:reading_app/features/home/services/categories/categories_states.dart';
import 'package:reading_app/features/home/view/components/authors_section.dart';
import 'package:reading_app/features/home/view/components/books_section.dart';
import 'package:reading_app/features/home/view/components/categories_section.dart';
import 'package:reading_app/features/shared/models/author.dart';
import 'package:reading_app/features/shared/models/book.dart';
import 'package:reading_app/features/shared/models/category.dart';
import 'package:reading_app/features/shared/widgets/error_dialog.dart';
import 'package:reading_app/features/shared/widgets/loading_screen.dart';
import 'package:reading_app/features/shared/widgets/sliver_app_bar.dart';
import '../services/authors/authors_cubit.dart';
import 'components/home_purple_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController searchController;

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesStates>(
        builder: (BuildContext context, CategoriesStates categoriesState) {
      return BlocBuilder<AuthorsCubit, AuthorsStates>(
          builder: (BuildContext context, AuthorsStates authorState) {
        return BlocBuilder<BooksCubit, BooksStates>(
            builder: (BuildContext context, BooksStates booksState) {
          if (booksState is BooksLoading ||
              authorState is AuthorsLoading ||
              categoriesState is CategoriesLoading) {
            return const LoadingScreen(
            );
          }
          else if (booksState is BooksSuccess &&
              authorState is AuthorsSuccess &&
              categoriesState is CategoriesSuccess) {
            List<BookModel>books=booksState.books;
            List<Author>authors=authorState.authors;
            List<CategoryModel>categories=categoriesState.categories;
            return CustomScrollView(
              slivers: [
                const SliverBar(
                  whiteColor: false,
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      HomePurpleContainer(searchController: searchController),
                      Text(
                        JsonConsts.categories.t(context),
                        style: StylesConsts.f18W600Black.copyWith(fontSize: 23),
                      ).mainPadding,
                       5.spaceH,
                       CategoriesSection(categories: categories,),
                      5.spaceH,
                       AuthorsSection(authors: authors,),
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
                    sliver: BooksSection(books:books ,)),
              ],
            );
          }
          else {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (!mounted) return;  // Check if the widget is still mounted
              showCustomErrorDialog(
                onPressed: () {
                  Navigator.pop(context);
                  context.read<BooksCubit>().getBooks();
                  context.read<AuthorsCubit>().getAuthors();
                  context.read<CategoriesCubit>().getCategories();
                },
                context: context,
                message: "Error Happened",
              );
            });
            return const SizedBox();  // Return an empty widget to continue the UI flow
          }


            }
        );
      });
    });
  }
}
