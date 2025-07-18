part of 'favorite_books_cubit.dart';

@immutable
sealed class FavoriteBooksState {}

final class FavoriteBooksInitial extends FavoriteBooksState {}
final class FavoriteBooksLoading extends FavoriteBooksState {}
final class FavoriteBooksSuccess extends FavoriteBooksState {
  final List<BookModel> books;

  FavoriteBooksSuccess(this.books);
}
final class FavoriteBooksFailure extends FavoriteBooksState {
  final String message;

  FavoriteBooksFailure(this.message);
}