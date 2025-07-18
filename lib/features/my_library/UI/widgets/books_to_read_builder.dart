import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/core/lists/dummy_books.dart';
import 'package:reading_app/core/utils/constants/colors_consts.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/my_library/services/to_read/to_read_cubit.dart';
import 'package:reading_app/features/shared/widgets/list_of_books_screen/list_of_books_screen.dart';
import 'package:reading_app/features/shared/widgets/something_went_wrong.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BooksToReadBuilder extends StatelessWidget {
  const BooksToReadBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToReadCubit, ToReadState>(
      builder: (context, state) {
        if (state is ToReadLoading) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Skeletonizer(
                enabled: true,
                child: ListOfBooksSliver(
                  bookList: dummyBook,
                  title: JsonConsts.booksToRead.t(context),
                ),
              ),
              childCount: dummyBook.length,
            ),
          );
        }

        if (state is ToReadSuccess) {
          final books = state.books;

          if (books.isEmpty) {
            return SliverFillRemaining(
              child: Center(
                child: Text(
                  JsonConsts.ThereAreNoBooksCurrently.t(context),
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
            onPressed: () => context.read<ToReadCubit>().getToReadBooks(),
          ),
        );
      },
    );
  }
}
