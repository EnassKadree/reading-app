import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/my_library/UI/screens/book_in_progrees.dart';
import 'package:reading_app/features/my_library/UI/screens/books_to_read.dart';
import 'package:reading_app/features/my_library/UI/screens/completed_books.dart';
import 'package:reading_app/features/my_library/UI/screens/favorite_books.dart';
import 'package:reading_app/features/my_library/UI/widgets/book_card_mylib.dart';
import 'package:reading_app/features/my_library/services/book_pdf/book_pdf_cubit.dart';
import 'package:reading_app/features/my_library/services/complered_books/completed_books_cubit.dart';
import 'package:reading_app/features/my_library/services/favorite_books/favorite_books_cubit.dart';
import 'package:reading_app/features/my_library/services/in_read/in_read_cubit.dart';
import 'package:reading_app/features/my_library/services/to_read/to_read_cubit.dart';

class SliverBookCardGrid extends StatelessWidget {
  const SliverBookCardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final cards = [
      BookCard(
        title: JsonConsts.bookInProgress.t(context),
        icon: Icons.bookmark_outline,
        isLeftImage: true,
        onTap: () {
          context.push(
            MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => InReadCubit()..getInReadBooks()),
                BlocProvider(create: (_) => BookPdfCubit()),
              ],
              child: const BookInProgrees(),
            ),
          );
        },
      ).staggeredGrid(0),
      BookCard(
        title: JsonConsts.favoriteBooks.t(context),
        icon: Icons.favorite_border,
        onTap: () {
          context.push(
            BlocProvider(
              create: (_) => FavoriteBooksCubit()..getFavoriteBooks(),
              child: const FavoriteBooks(),
            ),
          );
        },
      ).staggeredGrid(1),
      BookCard(
        title: JsonConsts.booksToRead.t(context),
        icon: Icons.menu_book,
        isLeftImage: true,
        onTap: () {
          context.push(
            BlocProvider(
              create: (_) => ToReadCubit()..getToReadBooks(),
              child: const BooksToRead(),
            ),
          );
        },
      ).staggeredGrid(2),
      BookCard(
        title: JsonConsts.completedBooks.t(context),
        icon: Icons.emoji_events_outlined,
        onTap: () {
          context.push(
            BlocProvider(
              create: (_) => CompletedBooksCubit()..getCompletedBooks(),
              child: const CompletedBooks(),
            ),
          );
        },
      ).staggeredGrid(3),
    ];

    return SliverPadding(
      padding: const EdgeInsets.all(18),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) => cards[index],
          childCount: cards.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1,
        ),
      ),
    );
  }
}