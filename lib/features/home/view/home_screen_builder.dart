import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/core/lists/dummy_authors.dart';
import 'package:reading_app/core/lists/dummy_books.dart';
import 'package:reading_app/features/home/services/authors/authors_states.dart';
import 'package:reading_app/features/home/services/books/books_cubit.dart';
import 'package:reading_app/features/home/services/books/books_states.dart';
import 'package:reading_app/features/home/services/categories/categories_cubit.dart';
import 'package:reading_app/features/home/services/categories/categories_states.dart';
import 'package:reading_app/features/home/view/components/home_screen_body.dart';
import 'package:reading_app/features/shared/models/author.dart';
import 'package:reading_app/features/shared/models/book.dart';
import 'package:reading_app/features/shared/models/category.dart';
import 'package:reading_app/features/shared/widgets/error_dialog.dart';
import '../../../core/lists/dummy_categories.dart';
import '../../../core/lists/dummy_user_challenges.dart';
import '../../shared/models/user_challenge.dart';
import '../services/active_challenges/user_challenges_cubit.dart';
import '../services/active_challenges/user_challenges_states.dart';
import '../services/authors/authors_cubit.dart';

class HomeScreenBuilder extends StatefulWidget {
  const HomeScreenBuilder({super.key});

  @override
  State<HomeScreenBuilder> createState() => _HomeScreenBuilderState();
}

class _HomeScreenBuilderState extends State<HomeScreenBuilder> {
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
    return BlocBuilder<UserChallengesCubit, UserChallengesStates>(
        builder: (BuildContext context, UserChallengesStates challengesState)  {
        return BlocBuilder<CategoriesCubit, CategoriesStates>(
            builder: (BuildContext context, CategoriesStates categoriesState) {
              return BlocBuilder<AuthorsCubit, AuthorsStates>(
                  builder: (BuildContext context, AuthorsStates authorState) {
                    return BlocBuilder<BooksCubit, BooksStates>(
                        builder: (BuildContext context, BooksStates booksState) {
                          if (booksState is BooksLoading ||
                              authorState is AuthorsLoading ||
                              categoriesState is CategoriesLoading) {
                            return  HomeScreenBody(
                              loading: true,
                                userChallenges: dummyUserChallenges,
                                authors: dummyAuthors,
                                books: dummyBook,
                                categories: dummyCategories
                            );
                          }
                          else if (booksState is BooksSuccess &&
                              authorState is AuthorsSuccess &&
                              categoriesState is CategoriesSuccess&&
                              challengesState is UserChallengeSuccess) {
                            List<UserChallenge> userChallenges =
                                challengesState.userChallenges;
                            print(userChallenges);

                            List<BookModel>books=booksState.books;
                            List<Author>authors=authorState.authors;
                            List<CategoryModel>categories=categoriesState.categories;
                            return HomeScreenBody(userChallenges: userChallenges, authors: authors, books: books, categories: categories);
                          }
                          else if(booksState is BooksError ||
                              authorState is AuthorsError ||
                              categoriesState is CategoriesError||
                              challengesState is UserChallengeError) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              if (!mounted) return;
                              showCustomErrorDialog(
                                onPressed: () {
                                  Navigator.pop(context);
                                  context.read<BooksCubit>().getBooks();
                                  context.read<AuthorsCubit>().getAuthors();
                                  context.read<CategoriesCubit>().getCategories();
                                },
                                context: context,
                                message:"Something Went Wrong" ,
                              );
                            });
                            return const SizedBox();  // Return an empty widget to continue the UI flow
                          }

                         else return SizedBox();
                        }
                    );
                  });
            });
      }
    );
  }
}