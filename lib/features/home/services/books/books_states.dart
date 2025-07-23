
import 'package:reading_app/features/shared/models/book.dart';

abstract class BooksStates {}

class BooksInitial extends BooksStates {}

class BooksLoading extends BooksStates {}

class BooksSuccess extends BooksStates {
  final List<BookModel> books;

  BooksSuccess(this.books);
}

class BooksError extends BooksStates {
  final String errorMessage;

  BooksError(this.errorMessage);
}
