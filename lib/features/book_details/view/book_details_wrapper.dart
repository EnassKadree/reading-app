import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/features/book_details/service/join_book_challenge/join_book_challenge_cubit.dart';
import 'package:reading_app/features/book_details/service/rate_the_book/rate_the_book_cubit.dart';
import 'package:reading_app/features/book_details/view/book_details_screen.dart';
import 'package:reading_app/features/shared/models/book.dart';

import '../service/book_challenge/book_challenge_cubit.dart';

class BookDetailsWrapper extends StatelessWidget {
  const BookDetailsWrapper({ required this.book,super.key});
  final BookModel book ;

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers:   [BlocProvider(create: (BuildContext context){
          return BookChallengeCubit()..getBookChallenge(book.id);
        },),BlocProvider(create: (BuildContext context){
          return JoinBookChallengeCubit();
    }),
        BlocProvider(create: (BuildContext context){
          return RateTheBookCubit();
        }),
      ],
        child:
BookDetailsScreen(book: book));
  }
}
