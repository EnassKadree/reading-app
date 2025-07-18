import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:reading_app/core/lists/dummy_books.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/author_details/service/author_books_cubit.dart';
import 'package:reading_app/features/author_details/service/author_books_states.dart';

import '../../../shared/widgets/book_card/book_card.dart';

class AuthorBooksSection extends StatelessWidget {
  const AuthorBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthorBooksCubit, AuthorBooksStates>(
      builder: (BuildContext context, AuthorBooksStates state) {
        return AnimationLimiter(
          child: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return BookCard(book: dummyBook[index]).staggeredGrid(index);
              },
              childCount: 15,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 0.6,
            ),
          ),
        );
      },
    );
  }
}
