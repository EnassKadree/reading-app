import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/features/book_details/view/book_details_screen.dart';
import 'package:reading_app/features/shared/models/book.dart';

import '../service/book_challenge/book_challenge_cubit.dart';

class BookDetailsWrapper extends StatelessWidget {
  const BookDetailsWrapper({ required this.book,super.key});
  final BookModel book ;

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create: (BuildContext context){
          print ("screeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeen");
          return BookChallengeCubit()..getBookChallenge(book.id);
        },
        child:
BookDetailsScreen(book: book));
  }
}
