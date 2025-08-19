import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/features/author_details/view/author_details_screen.dart';

import '../../shared/models/author.dart';
import '../service/author_books_cubit.dart';

class AuthorDetailsWrapper extends StatelessWidget {
  const AuthorDetailsWrapper({required this.author,super.key});
  final Author author;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context){
      return AuthorBooksCubit()..getAuthorBooks(author.id);},
      child: AuthorDetailsScreen(author: author),);
  }
}