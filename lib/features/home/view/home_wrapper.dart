import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/features/home/services/active_challenges/user_challenges_cubit.dart';
import 'package:reading_app/features/home/services/authors/authors_cubit.dart';
import 'package:reading_app/features/home/services/books/books_cubit.dart';
import 'package:reading_app/features/home/services/categories/categories_cubit.dart';
import 'package:reading_app/features/home/view/home_screen_builder.dart';
import 'package:reading_app/features/notifications/logic/notifications_count/notifications_count_cubit.dart';

class HomeWrapper extends StatelessWidget {
  const HomeWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (BuildContext context) {
          context.read<NotificationsCountCubit>().get();
          return UserChallengesCubit()..getActiveChallenges();
        },
      ),
      BlocProvider(
        create: (BuildContext context) {
          return CategoriesCubit()..getCategories();
        },
      ),
      BlocProvider(
        create: (BuildContext context) {
          return AuthorsCubit()..getAuthors();
        },
      ),
      BlocProvider(
        create: (BuildContext context) {
          return BooksCubit()..getBooks();
        },
      ),
    ], child: const HomeScreenBuilder());
  }
}
