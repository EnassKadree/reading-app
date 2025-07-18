part of 'to_read_cubit.dart';

@immutable
sealed class ToReadState {}

final class ToReadInitial extends ToReadState {}
final class ToReadLoading extends ToReadState {}
final class ToReadSuccess extends ToReadState {
  final List<BookModel> books;

  ToReadSuccess(this.books);
}
final class ToReadFailure extends ToReadState {
  final String message;

  ToReadFailure(this.message);
}