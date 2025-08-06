import 'package:flutter/material.dart';
import 'package:reading_app/features/my_library/UI/widgets/completed_books_builder.dart';

class CompletedBooks extends StatelessWidget {
  const CompletedBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
        body:
       CompletedBooksBuilder()
    );
  }
}