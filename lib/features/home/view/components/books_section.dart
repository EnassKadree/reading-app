import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:reading_app/core/lists/dummy_books.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/home/services/books/books_cubit.dart';
import 'package:reading_app/features/home/services/books/books_states.dart';
import 'package:reading_app/features/shared/models/book.dart';
import 'package:reading_app/features/shared/widgets/loading_screen.dart';
import '../../../shared/widgets/book_card/book_card.dart';

class BooksSection extends StatelessWidget {
  const BooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksCubit, BooksStates>(
      builder: (BuildContext context, BooksStates state) {
        if(state is BooksSuccess) {
          List<BookModel>books=state.books;
        
        return AnimationLimiter(
          child: SliverGrid(
            delegate: SliverChildBuilderDelegate(
<<<<<<< HEAD
              (BuildContext context, int index) {
                return BookCard(
                  bookModel:books[index] ,
                ).staggeredGrid(index);
=======
                  (BuildContext context, int index) {
                return  BookCard(book: dummyBook[1],).staggeredGrid(index);
>>>>>>> 4491f43eb0fc75d324bb09661fde5303c7bf5287
              },
              childCount: books.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 0.6,
            ),
          ),
        );}
        else if (state is BooksLoading)
          return  SliverPadding(padding: EdgeInsets.all(5),);
        else return   SliverPadding(padding: EdgeInsets.all(5),);
      },
    );
  }
}
