import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    final dummyBook = BookModel(
  id: 0,
                  title: '',
                  description: '',
                  authorName: '',
                  countryFlag: '',
                  publishDate: '',
                  starRate: 0,
                  readersCount: 0,
                  categoryName: '',
                  sizeCategoryName: '',
                  numberOfPages: 0,
                  isFavourite: false,
                  isInLibrary: false,
                  coverImage: '',
);
    return BlocBuilder<InReadCubit, InReadState>(
      builder: (context, state) {
        if (state is InReadLoading) {
          return Skeletonizer(
            enabled: true,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => CardInProgress(
                book: dummyBook
              ),
            ),
          );
        }

        if (state is InReadSuccess) {
          final books = state.books;

          if (books.isEmpty) {
            return Center(
              child: Text(
                JsonConsts.thereAreCurrentlyNoBooks.t(context),
                style: StylesConsts.f18W600Black,
              ),
            );
          }

          return ListView.builder(
            itemCount: books.length,
            itemBuilder: (context, index) {
              final book = books[index];
              return CardInProgress(book: book).staggerListHorizontal(index);
            },
          );
        }

        return SomeThingWentWrongWidget(
          onPressed: () => context.read<InReadCubit>().getInReadBooks(),
        );
      },
    );
  }
}
