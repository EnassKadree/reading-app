import 'package:reading_app/features/shared/models/book.dart';

abstract class CategoryBooksStates {}

class CategoryBooksInitial extends CategoryBooksStates {}

class CategoryBooksLoading extends CategoryBooksStates {}

class CategoryBooksSuccess extends CategoryBooksStates {
  List<BookModel> categoryBooks;

  CategoryBooksSuccess(this.categoryBooks);
}

class CategoryBooksError extends CategoryBooksStates {
  final String errorMessage;

  CategoryBooksError(this.errorMessage);
}
