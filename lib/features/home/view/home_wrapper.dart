import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/features/home/services/active_challenges/user_challenges_cubit.dart';
import 'package:reading_app/features/home/services/authors/authors_cubit.dart';
import 'package:reading_app/features/home/services/books/books_cubit.dart';
import 'package:reading_app/features/home/services/categories/categories_cubit.dart';
import 'package:reading_app/features/home/view/home_screen.dart';

class HomeWrapper extends StatelessWidget {
  const HomeWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (BuildContext context) {
        return UserChallengesCubit();
      },
      ),
      BlocProvider(create: (BuildContext context) {
        return CategoriesCubit();
      },
      ),
      BlocProvider(create: (BuildContext context) {
        return AuthorsCubit();
      },
      ),
      BlocProvider(create: (BuildContext context) {
        return BooksCubit();
      },
      ),
    ], child: const HomeScreen());
  }
}
