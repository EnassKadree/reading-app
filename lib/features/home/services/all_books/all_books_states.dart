
import 'package:reading_app/features/shared/models/book.dart';

abstract class AllBooksStates {}

class AllBooksInitial extends AllBooksStates {}

class AllBooksLoading extends AllBooksStates {}

class AllBooksSuccess extends AllBooksStates {
  final List<BookModel> books;

  AllBooksSuccess(this.books);
}

class AllBooksError extends AllBooksStates {
  final String errorMessage;

  AllBooksError(this.errorMessage);
}
