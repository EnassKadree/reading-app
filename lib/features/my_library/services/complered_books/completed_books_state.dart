part of 'completed_books_cubit.dart';

@immutable
sealed class CompletedBooksState {}

final class CompletedBooksInitial extends CompletedBooksState {}
final class CompletedBooksLoading extends CompletedBooksState {}
final class CompletedBooksSuccess extends CompletedBooksState {
  final List<BookModel> books;

 CompletedBooksSuccess(this.books);
}
final class CompletedBooksFailure extends CompletedBooksState {
  final String message;

  CompletedBooksFailure(this.message);
}