import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/core/lists/dummy_books.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/features/my_library/services/favorite_books/favorite_books_cubit.dart';
import 'package:reading_app/features/shared/widgets/list_of_books_screen/list_of_books_screen.dart';

import '../../../shared/widgets/error_dialog.dart';

class FavoriteBooksBuilder extends StatelessWidget {
  const FavoriteBooksBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteBooksCubit, FavoriteBooksState>(
      builder: (context, state) {
        if (state is FavoriteBooksLoading)
        {
          return ListOfBooksScreen(
                title: JsonConsts.favoriteBooks.t(context),
                bookList: dummyBook,
              );
        }
        if (state is FavoriteBooksSuccess) {
          final books = state.books;
          return ListOfBooksScreen(
            title: JsonConsts.favoriteBooks.t(context),
                      bookList: books,
                    );
        }

        return const SliverPadding(padding: EdgeInsets.zero);
      },
      listener: (context,state){
        if(state is FavoriteBooksFailure)
          {
            showCustomErrorDialog(
              message: state.message,
              context: context,
              onPressed: ()=> context.read<FavoriteBooksCubit>().getFavoriteBooks(),
            );
          }
      },
    );
  }
}
