import 'package:reading_app/features/shared/models/comment.dart';

abstract class BookCommentsStates {}
class InitialBookCommentsStates extends BookCommentsStates{}
class SuccessBookCommentsStates extends BookCommentsStates{
  List<Comment>comments;
  SuccessBookCommentsStates(this.comments);
}
class LoadingBookCommentsStates extends BookCommentsStates{}
class ErrorBookCommentsStates extends BookCommentsStates{
  String errorMessage;
  ErrorBookCommentsStates(this.errorMessage);
}
