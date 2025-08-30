part of 'general_challenges_cubit.dart';


sealed class GeneralChallengesState {}

final class GeneralChallengesInitial extends GeneralChallengesState {}

final class GeneralChallengesLoading extends GeneralChallengesState {}

final class GeneralChallengesFailure extends GeneralChallengesState {
  final String message;

  GeneralChallengesFailure(this.message);
}

final class GeneralChallengesSuccess extends GeneralChallengesState {
  final List<ChallengeModel> challenges;

  GeneralChallengesSuccess({
    required this.challenges
  });
}
