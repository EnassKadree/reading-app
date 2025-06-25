
import 'package:reading_app/features/home/services/books/books_cubit.dart';

import 'package:reading_app/features/home/services/books/books_cubit.dart';

import 'package:reading_app/features/home/services/books/books_cubit.dart';

import 'package:reading_app/features/home/services/books/books_cubit.dart';

import 'package:reading_app/features/home/services/books/books_cubit.dart';

import '../../../shared/models/book.dart';

abstract class BooksStates {}

class BooksInitial extends BooksStates {}

class BooksLoading extends BooksStates {}

class BooksSuccess extends BooksStates {
  final List<Book> books;

  BooksSuccess(this.books);
}

class BooksError extends BooksStates {
  final String errorMessage;

  BooksError(this.errorMessage);
}
