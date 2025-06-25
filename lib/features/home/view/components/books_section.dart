import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/features/home/services/books/books_cubit.dart';
import 'package:reading_app/features/home/services/books/books_states.dart';
import '../../../shared/widgets/book_card/book_card.dart';

class BooksSection extends StatelessWidget {
  const BooksSection({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksCubit, BooksStates>(
      builder: (BuildContext context, BooksStates state) {
        return SliverGrid(
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return const BookCard();
            },
            childCount: 15,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio:0.6,
          ),
        );
      },
    );
  }
}
