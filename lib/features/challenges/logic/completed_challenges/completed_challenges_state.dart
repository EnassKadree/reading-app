part of 'completed_challenges_cubit.dart';

sealed class CompletedChallengesState {}

final class CompletedChallengesInitial extends CompletedChallengesState {}

final class CompletedChallengesLoading extends CompletedChallengesState {}

final class CompletedChallengesFailure extends CompletedChallengesState {
  final String message;

  CompletedChallengesFailure(this.message);
}

final class CompletedChallengesSuccess extends CompletedChallengesState {
  final List<ChallengeModel> challenges;

  CompletedChallengesSuccess({
    required this.challenges
  });
}
