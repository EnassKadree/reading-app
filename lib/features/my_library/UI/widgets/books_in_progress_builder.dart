import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/core/lists/dummy_books.dart';
import 'package:reading_app/core/utils/constants/colors_consts.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/my_library/UI/widgets/card_in_progress/card_in_progress.dart';
import 'package:reading_app/features/my_library/services/in_read/in_read_cubit.dart';
import 'package:reading_app/features/shared/models/book.dart';
import 'package:reading_app/features/shared/widgets/something_went_wrong.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BooksInProgressBuilder extends StatelessWidget {
  const BooksInProgressBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InReadCubit, InReadState>(
      builder: (context, state) {
        if (state is InReadLoading) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Skeletonizer(
                enabled: true,
                child: CardInProgress(book: dummyBook[index]),
              ),
              childCount: dummyBook.length,
            ),
          );
        }

        if (state is InReadSuccess) {
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
                final book = books[index];
                return CardInProgress(book: book).staggerListHorizontal(index);
              },
              childCount: books.length,
            ),
          );
        }

        return SliverFillRemaining(
          child: SomeThingWentWrongWidget(
            onPressed: () => context.read<InReadCubit>().getInReadBooks(),
          ),
        );
      },
    );
  }
}
