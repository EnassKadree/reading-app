abstract class JoinBookChallengeStates {}
class JoinBookChallengeInitial  extends JoinBookChallengeStates{}
class JoinBookChallengeSuccess  extends JoinBookChallengeStates{}
class JoinBookChallengeError  extends JoinBookChallengeStates{
  String errorMessage;
  JoinBookChallengeError(this.errorMessage);
}
class JoinBookChallengeLoading extends JoinBookChallengeStates{}