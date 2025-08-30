import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/core/lists/dummy_books.dart';
import 'package:reading_app/features/home/services/all_books/all_books_cubit.dart';
import 'package:reading_app/features/home/services/all_books/all_books_states.dart';
import 'package:reading_app/features/shared/widgets/list_of_books_screen/list_of_books_screen.dart';
import 'package:reading_app/features/shared/widgets/something_went_wrong.dart';

class AllBooksScreen extends StatelessWidget {
  const AllBooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllBooksCubit,AllBooksStates>(builder: (BuildContext context,AllBooksStates state){
      if(state is AllBooksSuccess) {
        return ListOfBooksScreen(title: "", bookList: state.books);
      }
      else if(state is AllBooksLoading)
        {
          return ListOfBooksScreen(title: "", bookList: dummyBook);
        }
      else
        {return SomeThingWentWrongWidget(onPressed: (){context.read<AllBooksCubit>().getAllBooks();});}
    },);
  }
}
