import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/core/lists/dummy_books.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/features/my_library/services/to_read/to_read_cubit.dart';
import 'package:reading_app/features/shared/widgets/error_dialog.dart';
import 'package:reading_app/features/shared/widgets/list_of_books_screen/list_of_books_screen.dart';
class BooksToReadBuilder extends StatelessWidget {
  const BooksToReadBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ToReadCubit, ToReadState>(
      builder: (context, state) {
        if (state is ToReadLoading) {
          return  ListOfBooksScreen(
              title: JsonConsts.booksToRead.t(context),
              bookList: dummyBook,
          );
        }

        if (state is ToReadSuccess) {
          final books = state.books;
          return ListOfBooksScreen(
            title:   JsonConsts.booksToRead.t(context),
                 bookList: books,
               );
        }

        return const SliverPadding(padding: EdgeInsets.zero);
      },
      listener: (context,state){
        if(state is ToReadFailure) {
          showCustomErrorDialog(context: context, message: state.message, onPressed:()=>context.read<ToReadCubit>().getToReadBooks());
        }
      },
    );
  }
}
