import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/core/lists/dummy_books.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/features/my_library/services/complered_books/completed_books_cubit.dart';
import '../../../shared/widgets/error_dialog.dart';
import '../../../shared/widgets/list_of_books_screen/list_of_books_screen.dart';
class CompletedBooksBuilder extends StatelessWidget {
  const CompletedBooksBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompletedBooksCubit, CompletedBooksState>(
      builder: (context, state) {
        if (state is CompletedBooksLoading) {
          return
            ListOfBooksScreen(
                title: JsonConsts.finishedBooks.t(context),
                bookList: dummyBook,
          );
        }

        if (state is CompletedBooksSuccess) 
        {
          final books = state.books;
          return ListOfBooksScreen(
            title: JsonConsts.finishedBooks.t(context),
              bookList: books,
                    );
        }
        return const SliverPadding(padding: EdgeInsets.zero);
      },
      listener: (context,state){
        if (state is CompletedBooksFailure)
          {
            showCustomErrorDialog(message:state.message,context: context,onPressed: (){context.read<CompletedBooksCubit>().getCompletedBooks();});
          }
      },

    );
  }
}
