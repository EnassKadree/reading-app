import '../../shared/models/book.dart';

abstract class AuthorBooksStates {}

class AuthorBooksInitial extends AuthorBooksStates {}

class AuthorBooksLoading extends AuthorBooksStates {}

class AuthorBooksSuccess extends AuthorBooksStates {
  final List<Book> authorBooks;

  AuthorBooksSuccess(this.authorBooks);
}

class AuthorBooksError extends AuthorBooksStates {
  final String errorMessage;

  AuthorBooksError(this.errorMessage);
}
