import 'package:reading_app/features/shared/models/book_challenge.dart';

abstract class BookChallengeStates{}
class BookChallengeInitial extends BookChallengeStates{}
class BookChallengeSuccess extends BookChallengeStates{
  BookChallenge bookChallenge;
  BookChallengeSuccess(this.bookChallenge);
}
class BookChallengeLoading extends BookChallengeStates{}
class BookChallengeError extends BookChallengeStates
{
  String errorMessage;
  BookChallengeError(this.errorMessage);
}
