import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/core/lists/dummy_books.dart';
import 'package:reading_app/core/utils/constants/colors_consts.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/my_library/services/complered_books/completed_books_cubit.dart';
import 'package:reading_app/features/shared/widgets/list_of_books_screen/list_of_books_screen.dart';
import 'package:reading_app/features/shared/widgets/something_went_wrong.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CompletedBooksBuilder extends StatelessWidget {
  const CompletedBooksBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompletedBooksCubit, CompletedBooksState>(
      builder: (context, state) {
        if (state is CompletedBooksLoading) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Skeletonizer(
                enabled: true,
                child: ListOfBooksSliver(
                  bookList: dummyBook,
                  title: JsonConsts.completedBooks.t(context),
                ),
              ),
              childCount:dummyBook.length,
            ),
          );
        }

        if (state is CompletedBooksSuccess) {
          final books = state.books;

          if (books.isEmpty) {
            return SliverFillRemaining(
              child: Center(
                child: Text(
                  JsonConsts.thereAreCurrentlyNoBooks.t(context),
                  style: StylesConsts.f18W600Black
                      .copyWith(color: ColorsConsts.purple),
                ),
              ),
            );
          }

          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
              
                return ListOfBooksSliver(
                  bookList: books,
                  title: '',
                ).staggerListHorizontal(index);
              },
              childCount: books.length,
            ),
          );
        }

        return SliverToBoxAdapter(
          child: SomeThingWentWrongWidget(
            onPressed: () => context.read<CompletedBooksCubit>().getCompletedBooks(),
          ),
        );
      },
    );
  }
}
