abstract class CommentOnBookStates {}
class SuccessCommentOnBookStates extends  CommentOnBookStates{
  String comment;
  SuccessCommentOnBookStates(this.comment);
}
class InitialCommentOnBookStates extends  CommentOnBookStates{}
class LoadingCommentOnBookStates extends  CommentOnBookStates{}
class ErrorCommentOnBookStates extends  CommentOnBookStates{
  String errorMessage;
  ErrorCommentOnBookStates(this.errorMessage);
}