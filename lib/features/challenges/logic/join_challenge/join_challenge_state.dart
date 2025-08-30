part of 'join_challenge_cubit.dart';

@immutable
sealed class JoinChallengeState {}

final class JoinChallengeInitial extends JoinChallengeState {}

final class JoinChallengeLoading extends JoinChallengeState {}

final class JoinChallengeFailure extends JoinChallengeState {
  final String message;
  JoinChallengeFailure(this.message);
}

final class JoinChallengeSuccess extends JoinChallengeState {
  final int challengeId;
  final String message;
  JoinChallengeSuccess(this.message, this.challengeId);
}
