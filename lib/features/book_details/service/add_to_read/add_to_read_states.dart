abstract class AddToReadStates{}
class InitialAddToReadState extends AddToReadStates{}
class SuccessAddToReadState extends AddToReadStates{}
class LoadingAddToReadState extends AddToReadStates{}
class ErrorAddToReadState extends AddToReadStates{
  String errorMessage;
  ErrorAddToReadState(this.errorMessage);
}