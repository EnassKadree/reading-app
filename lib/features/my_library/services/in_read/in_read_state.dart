part of 'in_read_cubit.dart';

@immutable
sealed class InReadState {}

final class InReadInitial extends InReadState {}
final class InReadLoading extends InReadState {}
final class InReadSuccess extends InReadState {
  final List<BookModel> books;

  InReadSuccess(this.books);
}
final class InReadFailure extends InReadState {
  final String message;

  InReadFailure(this.message);
}