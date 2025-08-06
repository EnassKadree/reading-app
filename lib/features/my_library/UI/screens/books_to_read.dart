import 'package:flutter/material.dart';
import 'package:reading_app/features/my_library/UI/widgets/books_to_read_builder.dart';

class BooksToRead extends StatelessWidget {
  const BooksToRead({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: BooksToReadBuilder(),);
  }
}
