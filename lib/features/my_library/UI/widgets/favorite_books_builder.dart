import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/core/lists/dummy_books.dart';
import 'package:reading_app/core/utils/constants/colors_consts.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/features/my_library/services/favorite_books/favorite_books_cubit.dart';
import 'package:reading_app/features/shared/widgets/something_went_wrong.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../shared/widgets/list of books sliver.dart';

class FavoriteBooksBuilder extends StatelessWidget {
  const FavoriteBooksBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBooksCubit, FavoriteBooksState>(
      builder: (context, state) {
        if (state is FavoriteBooksLoading) {
          return SliverToBoxAdapter(
              child: Skeletonizer(
            enabled: true,
            child: ListOfBooksSliver(
              bookList: dummyBook,
            ),
          ));
        }

        if (state is FavoriteBooksSuccess) {
          final books = state.books;

          if (books.isEmpty) {
            return SliverFillRemaining(
              child: Center(
                child: Text(
                  JsonConsts.thereAreNoBooksCurrently.t(context),
                  style: StylesConsts.f18W600Black
                      .copyWith(color: ColorsConsts.purple),
                ),
              ),
            );
          }

          return SliverToBoxAdapter(
              child: ListOfBooksSliver(
            bookList: books,
          ));
        }

        return SliverToBoxAdapter(
          child: SomeThingWentWrongWidget(
            onPressed: () =>
                context.read<FavoriteBooksCubit>().getFavoriteBooks(),
          ),
        );
      },
    );
  }
}
