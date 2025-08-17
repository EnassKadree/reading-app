part of 'reading_progress_cubit.dart';

@immutable
sealed class ReadingProgressState {}

final class ReadingProgressInitial extends ReadingProgressState {}


class ReadingProgressLoading extends ReadingProgressState {}

class ReadingProgressSuccess extends ReadingProgressState {
  final String message;
  ReadingProgressSuccess(this.message);
}

class ReadingProgressFailure extends ReadingProgressState {
  final String error;
  ReadingProgressFailure(this.error);
}