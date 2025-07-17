import 'package:flutter/material.dart';
import 'package:reading_app/features/my_library/UI/widgets/books_in_progress_builder.dart';

class BookInProgrees extends StatelessWidget {
  const BookInProgrees({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            height: MediaQuery.of(context).size.height / 1.0,
            child: const BooksInProgressBuilder()));
  }
}
