
import '../../../shared/models/user_challenge.dart';

abstract class UserChallengesStates {}

class UserChallengeInitial extends UserChallengesStates {}

class UserChallengeLoading extends UserChallengesStates {}

class UserChallengeSuccess extends UserChallengesStates {
 final List<UserChallenge> userChallenges;

  UserChallengeSuccess(this.userChallenges);
}

class UserChallengeError extends UserChallengesStates {
final String errorMessage;
UserChallengeError(this.errorMessage);
}
