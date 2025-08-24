
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/author_details/service/author_books_cubit.dart';
import 'package:reading_app/features/author_details/service/author_books_states.dart';
import 'package:reading_app/features/shared/models/book.dart';
import 'package:reading_app/features/shared/widgets/error_dialog.dart';

import '../../../../core/lists/dummy_books.dart';
import '../../../shared/widgets/book_card/book_card.dart';
class AuthorBooksSection extends StatelessWidget {
  const AuthorBooksSection({ required this .authorId,super.key});
 final int authorId;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthorBooksCubit, AuthorBooksStates>(
      builder: (BuildContext context, AuthorBooksStates state) {
        if (state is AuthorBooksSuccess) {
          List<BookModel>books= state.authorBooks;
          return AnimationLimiter(
          child: SliverGrid(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
               return  BookCard(bookModel:books[index] ,).staggeredGrid(index);
              },
              childCount: books.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio:0.6,
            ),
          ),
        );
        }
        else if (state is AuthorBooksLoading)
          {
            List<BookModel>books=dummyBook ;
            return AnimationLimiter(
              child: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return  BookCard(bookModel:books[index] ,).staggeredGrid(index);
                  },
                  childCount: books.length,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio:0.6,
                ),
              ),
            );
          }
        else {
        return const SizedBox();
      }
    },
      listener:(BuildContext context, AuthorBooksStates state) {
        if(state is AuthorBooksError) {
          showCustomErrorDialog(context: context, message: state.errorMessage, onPressed: (){
            context.read<AuthorBooksCubit>().getAuthorBooks(authorId);
          });
        }
      }

    );
  }
}
