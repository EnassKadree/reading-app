part of 'mark_as_read_cubit.dart';

@immutable
sealed class MarkAsReadState {}

final class MarkAsReadInitial extends MarkAsReadState {}

final class MarkAsReadLoading extends MarkAsReadState {}

final class MarkAsReadFailure extends MarkAsReadState {
  final String message;
  MarkAsReadFailure(this.message);
}

final class MarkAsReadSuccess extends MarkAsReadState {
  final String message;
  MarkAsReadSuccess(this.message);
}
