part of 'suggestion_cubit.dart';

@immutable
sealed class SuggestionState {}

final class SuggestionInitial extends SuggestionState {}

final class SuggestionLoading extends SuggestionState {}

final class SuggestionFailure extends SuggestionState {
  final String message;
  SuggestionFailure(this.message);
}

final class SuggestionSuccess extends SuggestionState {
  final String message;
  SuggestionSuccess(this.message);
}
